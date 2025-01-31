import 'package:countdown/domain/models/countdown_event/countdown_event.dart';
import 'package:countdown/ui/widgets/countdown_timer_widget.dart';
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

    final event2 = CountdownEvent.create(
        name: 'Gym2',
        dateTime: DateTime.parse('2025-03-31 18:30:00'),
        timezone: 'Europe/Berlin',
        isRepeating: true,
        repeatConfig: const RepeatConfiguration(
          type: RepeatType.daily,
          interval: 1,
        ));

    final event3 = CountdownEvent.create(
        name: 'Gym3',
        dateTime: DateTime.parse('2025-12-31 18:30:00'),
        timezone: 'Europe/Berlin',
        isRepeating: true,
        repeatConfig: const RepeatConfiguration(
          type: RepeatType.daily,
          interval: 1,
        ));

    return Scaffold(
      body: ListView(
        children: [
          CountDownTimer(
            event: event,
          ),
          CountDownTimer(
            event: event2,
          ),
          CountDownTimer(
            event: event3,
          ),
          CountDownTimer(
            event: event,
          ),
          CountDownTimer(
            event: event,
          ),
          CountDownTimer(
            event: event2,
          ),
          CountDownTimer(
            event: event,
          ),
          CountDownTimer(
            event: event,
          ),
          CountDownTimer(
            event: event3,
          ),
          CountDownTimer(
            event: event,
          ),
          CountDownTimer(
            event: event,
          ),
          CountDownTimer(
            event: event,
          ),
          CountDownTimer(
            event: event,
          ),
          CountDownTimer(
            event: event2,
          ),
          CountDownTimer(
            event: event3,
          ),
          CountDownTimer(
            event: event,
          ),
          CountDownTimer(
            event: event,
          ),
          CountDownTimer(
            event: event,
          ),
          CountDownTimer(
            event: event,
          ),
          CountDownTimer(
            event: event3,
          ),
          CountDownTimer(
            event: event2,
          ),
          CountDownTimer(
            event: event,
          ),
          CountDownTimer(
            event: event,
          ),
          CountDownTimer(
            event: event3,
          ),
          CountDownTimer(
            event: event2,
          ),
          CountDownTimer(
            event: event,
          )
        ],
      ),
    );
  }
}
