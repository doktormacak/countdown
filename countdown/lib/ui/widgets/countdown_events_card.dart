import 'package:countdown/domain/models/countdown_event/countdown_event.dart';
import 'package:countdown/domain/models/event_timing_details/event_timing_details.dart';
import 'package:countdown/ui/view_model/countdown_event_view_model.dart';
import 'package:countdown/ui/widgets/countdown_event_form.dart';
import 'package:countdown/ui/widgets/countdown_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class EventCard extends ConsumerWidget {
  final CountdownEvent event;

  const EventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        title: Text(event.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (event.notes != null)
              Text(
                event.notes!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            const SizedBox(height: 4),
            _buildEventTiming(event),
          ],
        ),
        trailing: _buildMenuButton(context, ref),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CountdownScreen(event: event),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEventTiming(CountdownEvent event) {
    return switch (event.timing) {
      OneTimeEventTiming timing => Text(
          'One-time: ${DateFormat('HH:mm dd-MM-yyyy').format(timing.eventTime)}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      RecurringEventTiming timing => Builder(
          builder: (context) => Text(
            'Recurring: ${timing.timeOfDay.format(context)}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      _ => const Text('Unknown timing type'),
    };
  }

  Widget _buildMenuButton(BuildContext context, WidgetRef ref) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 'edit',
          child: Text('Edit'),
        ),
        const PopupMenuItem(
          value: 'archive',
          child: Text('Archive'),
        ),
        const PopupMenuItem(
          value: 'delete',
          child: Text('Delete'),
        ),
      ],
      onSelected: (value) async {
        switch (value) {
          case 'edit':
            Navigator.of(context).push(
              ModalBottomSheetRoute(
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                builder: (context) => EventFormBottomSheet(event: event),
              ),
            );
            break;
          case 'archive':
            await _archiveEvent(context, ref);
            break;
          case 'delete':
            await _deleteEvent(context, ref);
        }
      },
    );
  }

  Future<void> _archiveEvent(BuildContext context, WidgetRef ref) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    try {
      await ref
          .read(countdownEventViewModelProvider.notifier)
          .archiveEvent(event.id);
      scaffoldMessenger.showSnackBar(
        const SnackBar(content: Text('Event archived')),
      );
    } catch (e) {
      scaffoldMessenger.showSnackBar(
        SnackBar(content: Text('Failed to archive event: $e')),
      );
    }
  }

  Future<void> _deleteEvent(BuildContext context, WidgetRef ref) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    try {
      await ref
          .read(countdownEventViewModelProvider.notifier)
          .deleteEvent(event.id);
      scaffoldMessenger.showSnackBar(
        const SnackBar(content: Text('Event deleted')),
      );
    } catch (e) {
      scaffoldMessenger.showSnackBar(
        SnackBar(content: Text('Failed to delete event: $e')),
      );
    }
  }
}
