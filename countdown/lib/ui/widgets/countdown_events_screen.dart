import 'package:countdown/domain/models/countdown_event/countdown_event.dart';
import 'package:countdown/domain/models/event_timing_details/event_timing_details.dart';
import 'package:countdown/ui/view_model/countdown_event_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EventListScreen extends ConsumerWidget {
  const EventListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventsAsync = ref.watch(countdowmEvemtViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Countdown Events'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // TODO: Navigate to add event screen
            },
          ),
        ],
      ),
      body: eventsAsync.when(
        data: (events) => _EventList(events: events),
        error: (error, stackTrace) => _ErrorView(error: error),
        loading: () => const _LoadingView(),
      ),
    );
  }
}

class _EventList extends StatelessWidget {
  final List<CountdownEvent> events;

  const _EventList({required this.events});

  @override
  Widget build(BuildContext context) {
    if (events.isEmpty) {
      return const Center(
        child: Text('No events yet. Tap + to add one!'),
      );
    }

    return ListView.builder(
      itemCount: events.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        final event = events[index];
        return _EventCard(event: event);
      },
    );
  }
}

class _EventCard extends ConsumerWidget {
  final CountdownEvent event;

  const _EventCard({required this.event});

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
            _buildEventTiming(event, context),
          ],
        ),
        trailing: _buildMenuButton(context, ref),
        onTap: () {
          // TODO: Navigate to event details screen
        },
      ),
    );
  }

  Widget _buildEventTiming(CountdownEvent event, BuildContext context) {
    return switch (event.timing) {
      OneTimeEventTiming timing => Text(
          'One-time: ${timing.eventTime.toString()}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      RecurringEventTiming timing => Text(
          'Recurring: ${timing.timeOfDay.format(context)}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      _ => const Text(''),
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
      ],
      onSelected: (value) async {
        switch (value) {
          case 'edit':
            // TODO: Navigate to edit screen
            break;
          case 'archive':
            await _archiveEvent(context, ref);
            break;
        }
      },
    );
  }

  Future<void> _archiveEvent(BuildContext context, WidgetRef ref) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    try {
      await ref
          .read(countdowmEvemtViewModelProvider.notifier)
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
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final Object error;

  const _ErrorView({required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ),
            const SizedBox(height: 16),
            Text(
              'Something went wrong!',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              error.toString(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Invalidate the provider to trigger a refresh
              },
              child: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }
}
