import 'package:countdown/domain/models/countdown_event/countdown_event.dart';
import 'package:flutter/material.dart';

import '../../domain/models/repeat_config/repeat_config.dart';

class CountdownEventsScreen extends StatelessWidget {
  const CountdownEventsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final event = CountdownEvent.create(
        name: 'Gym',
        dateTime: DateTime.parse('2025-01-31 18:30:00'),
        timezone: 'Europe/Berlin',
        isRepeating: true,
        repeatConfig: const RepeatConfiguration(
          type: RepeatType.daily,
          interval: 1,
        ));

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              event.name,
              style: const TextStyle(
                fontSize: 50,
                color: Colors.white,
              ),
            ),
            Text(event.dateTime.toString()),
          ],
        ),
      ),
    );
  }
}
