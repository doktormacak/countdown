import 'dart:async';

import 'package:countdown/domain/models/countdown_event/countdown_event.dart';
import 'package:countdown/ui/view_model/countdown_view_model.dart';
import 'package:flutter/material.dart';

class CountDownTimer extends StatefulWidget {
  final CountdownEvent event;
  const CountDownTimer({super.key, required this.event});

  @override
  State<CountDownTimer> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  late final StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();
    final manager = CountdownManager();
    manager.start();

    _subscription = manager.stream.listen(
      (_) {
        if (mounted) {
          setState(
            () {},
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final remainingTime = widget.event.getRemainingDuration();
    return Row(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(widget.event.name),
        Text(_formatDuration(remainingTime)),
      ],
    );
  }

  String _formatDuration(Duration duration) {
    if (duration.isNegative) return 'Completed';

    final days = duration.inDays;
    final hours = duration.inHours % 24;
    final minutes = duration.inMinutes % 60;
    final seconds = duration.inSeconds % 60;

    if (days > 0) {
      return '$days days, ${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    } else if (hours > 0) {
      return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    } else {
      return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    }
  }
}
