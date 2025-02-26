import 'package:countdown/domain/models/countdown_event/countdown_event.dart';
import 'package:countdown/ui/widgets/countdown_events_card.dart';
import 'package:flutter/material.dart';

class EventList extends StatelessWidget {
  final List<CountdownEvent> events;

  const EventList({super.key, required this.events});

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
        return EventCard(event: event);
      },
    );
  }
}
