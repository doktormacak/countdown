import 'package:countdown/domain/models/countdown_event/countdown_event.dart';
import 'package:countdown/ui/view_model/countdown_bloc/countdown_state.dart';
import 'package:countdown/utils/format_duration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/countdown_bloc/countdown_bloc.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key, required this.event});
  final CountdownEvent event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.name),
      ),
      body: Center(
        child: BlocSelector<CountdownBloc, CountdownState, DateTime?>(
          selector: (state) => state.lastUpdated,
          builder: (context, lastUpdated) {
            final remaining = event.dateTime.difference(DateTime.now());
            return Text(remaining.formatDuration());
          },
        ),
      ),
    );
  }
}
