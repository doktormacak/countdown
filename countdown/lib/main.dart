import 'package:countdown/ui/widgets/countdown_events_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const CountdownEventsScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    );
  }
}

class CountdownEventsScreen extends StatelessWidget {
  const CountdownEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: EventListScreen());
  }
}
