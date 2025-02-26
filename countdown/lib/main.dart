import 'package:countdown/data/services/notifications_manager.dart';
import 'package:countdown/ui/widgets/countdown_events_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: CountdownEventsApp(),
    ),
  );
}

class CountdownEventsApp extends ConsumerWidget {
  const CountdownEventsApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(notificationManagerProvider);
    return MaterialApp(
      home: const CountdownEventsScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,
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
