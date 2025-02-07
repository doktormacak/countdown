import 'package:countdown/domain/models/countdown_event/countdown_event.dart';
import 'package:countdown/ui/view_model/countdown_bloc/countdown_bloc.dart';
import 'package:countdown/ui/view_model/countdown_bloc/countdown_event.dart';
import 'package:countdown/ui/view_model/countdown_bloc/countdown_state.dart';
import 'package:countdown/ui/widgets/event_screen.dart';
import 'package:countdown/utils/format_duration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountdownEventsScreen extends StatelessWidget {
  const CountdownEventsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountdownBloc, CountdownState>(
      buildWhen: (previous, current) => previous.events != current.events,
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () => _showAddEventDialog(context),
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
    );
  }
}

class Event extends StatelessWidget {
  const Event({
    super.key,
    required this.event,
  });

  final CountdownEvent event;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CountdownBloc, CountdownState, DateTime?>(
        selector: (state) => state.lastUpdated,
        builder: (context, lastUpdated) {
          final remaining = event.dateTime.difference(DateTime.now());
          return GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => EventScreen(event: event),
              ),
            ),
            child: Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(event.name),
                Text(remaining.formatDuration()),
              ],
            ),
          );
        });
  }
}

void _showAddEventDialog(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) => const Padding(
      padding: EdgeInsets.all(16.0),
      child: _CreateEventBottomSheet(),
    ),
  );
}

class _CreateEventBottomSheet extends StatefulWidget {
  const _CreateEventBottomSheet();

  @override
  State<_CreateEventBottomSheet> createState() =>
      _CreateEventBottomSheetState();
}

class _CreateEventBottomSheetState extends State<_CreateEventBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Create New Event',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
                filled: true,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a title';
                }
                return null;
              },
              textInputAction: TextInputAction.next,
              onSaved: (value) => _title = value ?? '',
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
                filled: true,
              ),
              maxLines: 3,
              textInputAction: TextInputAction.done,
              onSaved: (value) => _description = value ?? '',
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: _selectDateTime,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  _selectedDate != null
                      ? _formatDateTime(_selectedDate!)
                      : 'Select Date & Time',
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Add Event'),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  String _title = '';
  String _description = '';

  Future<void> _selectDateTime() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 10)),
    );

    if (date != null && mounted) {
      final time = await showTimePicker(
        initialEntryMode: TimePickerEntryMode.inputOnly,
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (time != null && mounted) {
        setState(() {
          _selectedDate = DateTime(
            date.year,
            date.month,
            date.day,
            time.hour,
            time.minute,
          );
        });
      }
    }
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} at '
        '${dateTime.hour.toString().padLeft(2, '0')}:'
        '${dateTime.minute.toString().padLeft(2, '0')}';
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_selectedDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please select a date and time'),
            behavior: SnackBarBehavior.floating,
          ),
        );
        return;
      }

      _formKey.currentState?.save();

      context.read<CountdownBloc>().add(
            CountdownBlocEventCreated(
              event: CountdownEvent.create(
                name: _title,
                notes: _description,
                dateTime: _selectedDate!,
                timezone: 'Europe/Berlin',
              ),
            ),
          );

      Navigator.pop(context);
    }
  }
}
