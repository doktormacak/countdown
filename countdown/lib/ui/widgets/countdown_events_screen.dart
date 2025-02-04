import 'package:countdown/domain/models/countdown_event/countdown_event.dart';
import 'package:countdown/domain/models/repeat_config/repeat_config.dart';
import 'package:countdown/ui/view_model/countdown_bloc/countdown_bloc.dart';
import 'package:countdown/ui/view_model/countdown_bloc/countdown_event.dart';
import 'package:countdown/ui/view_model/countdown_bloc/countdown_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountdownEventsScreen extends StatelessWidget {
  const CountdownEventsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CountdownBloc(),
      child: BlocBuilder<CountdownBloc, CountdownState>(
        buildWhen: (previous, current) => previous.events != current.events,
        builder: (context, state) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                context.read<CountdownBloc>().add(
                      CountdownBlocEventCreated(
                        event: CountdownEvent.create(
                          name: 'Gym',
                          dateTime: DateTime.parse('2025-02-05 18:30:00'),
                          timezone: 'Europe/Berlin',
                          isRepeating: true,
                          repeatConfig: const RepeatConfiguration(
                            type: RepeatType.daily,
                            interval: 1,
                          ),
                        ),
                      ),
                    );
              },
              child: const Icon(Icons.add),
            ),
            body: state.events.isEmpty
                ? const Center(
                    child: Text('No events'),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 16.0),
                    child: ListView.builder(
                      itemCount: state.events.length,
                      itemBuilder: (context, index) {
                        final event = state.events[index];
                        return Event(event: event);
                      },
                    ),
                  ),
          );
        },
      ),
    );
  }
}

class Event extends StatelessWidget {
  const Event({
    super.key,
    required this.event,
  });

  final CountdownEvent event;

  String _formatDuration(Duration d) {
    return "${d.inDays}d ${d.inHours.remainder(24)}h "
        "${d.inMinutes.remainder(60)}m ${d.inSeconds.remainder(60)}s";
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CountdownBloc, CountdownState, DateTime?>(
        selector: (state) => state.lastUpdated,
        builder: (context, lastUpdated) {
          final remaining = event.dateTime.difference(DateTime.now());
          return Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(event.name),
              Text(_formatDuration(remaining)),
            ],
          );
        });
  }
}
