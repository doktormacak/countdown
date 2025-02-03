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
        builder: (context, state) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                context.read<CountdownBloc>().add(
                      CountdownBlocEventCreated(
                        event: CountdownEvent.create(
                          name: 'Gym',
                          dateTime: DateTime.parse('2025-01-31 18:30:00'),
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
            body: state!.events.isEmpty
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
                        return Row(
                          spacing: 10,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(event.name),
                            Text(event.getRemainingDuration().toString()),
                          ],
                        );
                      },
                    ),
                  ),
          );
        },
      ),
    );
  }
}
