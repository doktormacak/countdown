import 'package:countdown/domain/models/countdown_event/countdown_event.dart';
import 'package:countdown/domain/models/event_timing_details/event_timing_details.dart';
import 'package:countdown/domain/models/reccurence_pattern/reccurence_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/countdown_display.dart';

class CountdownScreen extends ConsumerStatefulWidget {
  final CountdownEvent event;

  const CountdownScreen({
    super.key,
    required this.event,
  });

  @override
  ConsumerState<CountdownScreen> createState() => _CountdownScreenState();
}

class _CountdownScreenState extends ConsumerState<CountdownScreen> {
  bool _isFullscreen = false;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _isFullscreen
          ? SystemUiOverlayStyle.light.copyWith(
              statusBarColor: Colors.transparent,
              systemNavigationBarColor: Colors.black,
              systemNavigationBarIconBrightness: Brightness.light,
            )
          : SystemUiOverlayStyle.light,
      child: Scaffold(
        floatingActionButton: _isFullscreen
            ? FloatingActionButton(
                mini: true,
                backgroundColor: Colors.black45,
                foregroundColor: Colors.white,
                onPressed: _toggleFullscreen,
                child: const Icon(Icons.fullscreen_exit),
              )
            : null,
        backgroundColor: _isFullscreen ? Colors.black : null,
        appBar: _isFullscreen
            ? null
            : AppBar(
                title: const Text('Countdown'),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.fullscreen),
                    onPressed: _toggleFullscreen,
                    tooltip: 'Toggle fullscreen',
                  ),
                ],
              ),
        body: Countdown(
            event: widget.event,
            isFullscreen: _isFullscreen,
            toggleFullscreen: _toggleFullscreen),
      ),
    );
  }

  void _toggleFullscreen() {
    setState(() {
      _isFullscreen = !_isFullscreen;
    });

    if (_isFullscreen) {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.immersiveSticky,
      );
    } else {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.edgeToEdge,
      );
    }
  }

  @override
  void dispose() {
    if (_isFullscreen) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }
    super.dispose();
  }
}

class Countdown extends StatelessWidget {
  final bool isFullscreen;

  final CountdownEvent event;

  final VoidCallback toggleFullscreen;

  const Countdown(
      {super.key,
      required this.event,
      required this.isFullscreen,
      required this.toggleFullscreen});

  @override
  Widget build(BuildContext context) {
    if (isFullscreen) {
      return GestureDetector(
        onTap: toggleFullscreen,
        child: Container(
          color: Colors.black,
          width: double.infinity,
          height: double.infinity,
          child: SafeArea(
            child: CountdownDisplay(
              event: event,
              displayStyle: CountdownDisplayStyle.fullscreen,
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CountdownDisplay(
            event: event,
            displayStyle: CountdownDisplayStyle.detailed,
          ),
          const SizedBox(height: 32),
          _buildEventDetails(event, context),
        ],
      ),
    );
  }
}

Widget _buildEventDetails(CountdownEvent event, BuildContext context) {
  return Card(
    margin: EdgeInsets.zero,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Event Details',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const Divider(),
          const SizedBox(height: 8.0),
          _buildEventDetailRow(
              'Type',
              event.type == EventType.oneTime
                  ? 'One-time Event'
                  : 'Recurring Event'),
          switch (event.timing) {
            OneTimeEventTiming timing => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildEventDetailRow('Date', _formatDate(timing.eventTime)),
                  _buildEventDetailRow('Time', _formatTime(timing.eventTime)),
                  _buildEventDetailRow('Time Zone', timing.timeZone),
                ],
              ),
            RecurringEventTiming timing => Builder(
                builder: (context) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildEventDetailRow(
                          'Time', timing.timeOfDay.format(context)),
                      _buildEventDetailRow(
                          'Pattern', _formatRecurrencePattern(timing.pattern)),
                      if (timing.daysOfWeek.isNotEmpty)
                        _buildEventDetailRow('Days',
                            _formatDaysOfWeek(timing.daysOfWeek, context)),
                    ],
                  );
                },
              ),
            _ => const Text('Unknown timing type'),
          },
          if (event.notes != null && event.notes!.isNotEmpty) ...[
            const SizedBox(height: 16.0),
            Text(
              'Notes',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 4.0),
            Text(event.notes!),
          ],
        ],
      ),
    ),
  );
}

Widget _buildEventDetailRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
        Expanded(
          child: Text(value),
        ),
      ],
    ),
  );
}

String _formatDate(DateTime date) {
  return '${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}';
}

String _formatTime(DateTime time) {
  return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
}

String _formatRecurrencePattern(RecurrencePattern pattern) {
  final buffer = StringBuffer();

  buffer.write('Every ');
  if (pattern.interval > 1) {
    buffer.write('${pattern.interval} ');
  }

  switch (pattern.type) {
    case RecurrenceType.daily:
      buffer.write(pattern.interval > 1 ? 'days' : 'day');
    case RecurrenceType.weekly:
      buffer.write(pattern.interval > 1 ? 'weeks' : 'week');
    case RecurrenceType.monthly:
      buffer.write(pattern.interval > 1 ? 'months' : 'month');
    case RecurrenceType.yearly:
      buffer.write(pattern.interval > 1 ? 'years' : 'year');
  }

  return buffer.toString();
}

String _formatDaysOfWeek(Set<int> daysOfWeek, BuildContext context) {
  final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  final selectedDays = daysOfWeek.map((day) => days[day - 1]).toList()..sort();
  return selectedDays.join(', ');
}
