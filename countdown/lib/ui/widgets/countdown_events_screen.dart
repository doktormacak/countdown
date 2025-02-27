import 'package:countdown/data/services/logger_service.dart';
import 'package:countdown/ui/view_model/countdown_events/countdown_event_view_model.dart';
import 'package:countdown/ui/widgets/countdown_event_form.dart';
import 'package:countdown/ui/widgets/countdown_events_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EventListScreen extends ConsumerWidget {
  const EventListScreen({super.key, this.showAppBar = true});

  final bool showAppBar;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventsAsync = ref.watch(countdownEventViewModelProvider);

    return Scaffold(
      appBar: showAppBar
          ? AppBar(
              title: const Text('Countdown Events'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    Navigator.of(context).push(ModalBottomSheetRoute(
                        builder: (context) => const EventFormBottomSheet(),
                        isScrollControlled: true));
                  },
                ),
              ],
            )
          : null,
      body: eventsAsync.when(
        data: (events) => EventList(events: events),
        error: (error, stackTrace) =>
            _ErrorView(error: error, stackTrace: stackTrace),
        loading: () => const _LoadingView(),
      ),
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _ErrorView extends ConsumerWidget {
  final Object error;
  final StackTrace? stackTrace;

  const _ErrorView({required this.error, this.stackTrace});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(loggerProvider).error('Error loading events', error, stackTrace);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ),
            const SizedBox(height: 16),
            Text(
              'Something went wrong!',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              error.toString(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ref.invalidate(countdownEventViewModelProvider);
              },
              child: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }
}
