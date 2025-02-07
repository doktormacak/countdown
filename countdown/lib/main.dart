import 'package:countdown/ui/view_model/countdown_bloc/countdown_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ui/widgets/countdown_events_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountdownBloc(),
      child: MaterialApp(
        home: const CountdownEventsScreen(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
      ),
    );
  }
}
