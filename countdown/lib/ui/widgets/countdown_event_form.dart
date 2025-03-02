import 'package:countdown/data/services/logger_service.dart';
import 'package:countdown/domain/models/countdown_event/countdown_event.dart';
import 'package:countdown/domain/models/event_timing_details/event_timing_details.dart';
import 'package:countdown/domain/models/notification_settings/notification_settings.dart';
import 'package:countdown/domain/models/reccurence_pattern/reccurence_pattern.dart';
import 'package:countdown/ui/view_model/countdown_events/countdown_event_view_model.dart';
import 'package:countdown/ui/widgets/notifications_settings_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class EventFormBottomSheet extends ConsumerStatefulWidget {
  final CountdownEvent? event;

  const EventFormBottomSheet({
    super.key,
    this.event,
  });

  @override
  ConsumerState<EventFormBottomSheet> createState() =>
      _EventFormBottomSheetState();
}

class _EventFormBottomSheetState extends ConsumerState<EventFormBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _notesController;

  late EventType _eventType;

  // One-time event fields
  late DateTime _eventDate;
  late TimeOfDay _eventTime;
  late String _timeZone;

  // Recurring event fields
  late TimeOfDay _recurringTime;
  late RecurrenceType _recurrenceType;
  late Set<int> _selectedDays;

  // Notification settings
  late NotificationSettings _notificationSettings;

  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _initializeFields();
  }

  void _initializeFields() {
    final isEditMode = widget.event != null;

    if (isEditMode) {
      // Edit mode - initialize with existing event data
      final event = widget.event!;

      _titleController = TextEditingController(text: event.title);
      _notesController = TextEditingController(text: event.notes ?? '');
      _eventType = event.type;
      _notificationSettings = event.notificationSettings;

      // Initialize based on event type
      switch (event.timing) {
        case OneTimeEventTiming timing:
          _eventDate = timing.eventTime;
          _eventTime = TimeOfDay(
            hour: timing.eventTime.hour,
            minute: timing.eventTime.minute,
          );
          _timeZone = timing.timeZone;

          // Default values for recurring fields in case user switches
          _recurringTime = TimeOfDay.now();
          _recurrenceType = RecurrenceType.daily;
          _selectedDays = {1, 2, 3, 4, 5, 6, 7}; // Mon-Fri

        case RecurringEventTiming timing:
          _recurringTime = timing.timeOfDay;
          _recurrenceType = timing.pattern.type;
          _selectedDays = timing.daysOfWeek;

          // Default values for one-time fields in case user switches
          _eventDate = DateTime.now().add(const Duration(days: 1));
          _eventTime = TimeOfDay.now();
          _timeZone = 'UTC';
      }
    } else {
      // Create mode - initialize with defaults
      _titleController = TextEditingController();
      _notesController = TextEditingController();
      _eventType = EventType.oneTime;

      _eventDate = DateTime.now().add(const Duration(days: 1));
      _eventTime = TimeOfDay.now();
      _timeZone = 'UTC';

      _recurringTime = TimeOfDay.now();
      _recurrenceType = RecurrenceType.daily;
      _selectedDays = {1, 2, 3, 4, 5, 6, 7}; // Mon-Fri

      // Initialize notification settings with defaults
      _notificationSettings = const NotificationSettings(
        enabled: true,
        reminders: [NotificationReminders.thirtyMinutes],
      );
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditMode = widget.event != null;
    final title = isEditMode ? 'Edit Countdown' : 'Create New Countdown';
    final buttonText = isEditMode ? 'Save Changes' : 'Create Countdown';

    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),

              // Title field
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Notes field
              TextFormField(
                controller: _notesController,
                decoration: const InputDecoration(
                  labelText: 'Notes (Optional)',
                  border: OutlineInputBorder(),
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 16),

              // Event Type Selector
              Row(
                children: [
                  const Text('Event Type:'),
                  const SizedBox(width: 16),
                  SegmentedButton<EventType>(
                    segments: const [
                      ButtonSegment(
                        value: EventType.oneTime,
                        label: Text('One-time'),
                      ),
                      ButtonSegment(
                        value: EventType.recurring,
                        label: Text('Recurring'),
                      ),
                    ],
                    selected: {_eventType},
                    onSelectionChanged: (newSelection) {
                      setState(() {
                        _eventType = newSelection.first;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Conditional Fields based on Event Type
              if (_eventType == EventType.oneTime)
                _buildOneTimeEventFields(context)
              else
                _buildRecurringEventFields(context),

              const SizedBox(height: 16),

              // Notification Settings Section
              ExpansionTile(
                title: const Text('Notification Settings'),
                initiallyExpanded: false,
                children: [
                  NotificationSettingsForm(
                    initialSettings: _notificationSettings,
                    onSettingsChanged: (newSettings) {
                      setState(() {
                        _notificationSettings = newSettings;
                      });
                    },
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Error message
              if (_errorMessage != null)
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  color: Colors.red.shade50,
                  child: Text(
                    _errorMessage!,
                    style: TextStyle(color: Colors.red.shade800),
                    textAlign: TextAlign.center,
                  ),
                ),

              // Submit Button
              ElevatedButton(
                onPressed: _isLoading ? null : _submitForm,
                child: _isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(buttonText),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOneTimeEventFields(BuildContext context) {
    final dateFormat = DateFormat('EEE, MMM d, yyyy');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Event Date and Time:'),
        const SizedBox(height: 8),

        // Date Picker
        ListTile(
          title: Text('Date: ${dateFormat.format(_eventDate)}'),
          trailing: const Icon(Icons.calendar_today),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.grey.shade300),
          ),
          onTap: () async {
            final pickedDate = await showDatePicker(
              context: context,
              initialDate: _eventDate,
              firstDate: DateTime.now(),
              lastDate:
                  DateTime.now().add(const Duration(days: 3650)), // ~10 years
            );

            if (pickedDate != null) {
              setState(() {
                _eventDate = pickedDate;
              });
            }
          },
        ),
        const SizedBox(height: 8),

        // Time Picker
        ListTile(
          title: Text('Time: ${_eventTime.format(context)}'),
          trailing: const Icon(Icons.access_time),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.grey.shade300),
          ),
          onTap: () async {
            final pickedTime = await showTimePicker(
              context: context,
              initialTime: _eventTime,
            );

            if (pickedTime != null) {
              setState(() {
                _eventTime = pickedTime;
              });
            }
          },
        ),
        const SizedBox(height: 8),

        // Timezone Picker (simplified)
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            labelText: 'Time Zone',
            border: OutlineInputBorder(),
          ),
          value: _timeZone,
          items: const [
            DropdownMenuItem(value: 'UTC', child: Text('UTC')),
            DropdownMenuItem(
                value: 'America/New_York', child: Text('Eastern Time (ET)')),
            DropdownMenuItem(
                value: 'America/Chicago', child: Text('Central Time (CT)')),
            DropdownMenuItem(
                value: 'America/Denver', child: Text('Mountain Time (MT)')),
            DropdownMenuItem(
                value: 'America/Los_Angeles', child: Text('Pacific Time (PT)')),
          ],
          onChanged: (value) {
            if (value != null) {
              setState(() {
                _timeZone = value;
              });
            }
          },
        ),
      ],
    );
  }

  Widget _buildRecurringEventFields(BuildContext context) {
    const weekdays = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Time Picker
        ListTile(
          title: Text('Daily Time: ${_recurringTime.format(context)}'),
          trailing: const Icon(Icons.access_time),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.grey.shade300),
          ),
          onTap: () async {
            final pickedTime = await showTimePicker(
              context: context,
              initialTime: _recurringTime,
            );

            if (pickedTime != null) {
              setState(() {
                _recurringTime = pickedTime;
              });
            }
          },
        ),
        const SizedBox(height: 12),

        // Recurrence Type
        DropdownButtonFormField<RecurrenceType>(
          decoration: const InputDecoration(
            labelText: 'Recurrence Pattern',
            border: OutlineInputBorder(),
          ),
          value: _recurrenceType,
          items: RecurrenceType.values.map((type) {
            return DropdownMenuItem(
              value: type,
              child: Text(type.name.capitalize()),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              setState(() {
                _recurrenceType = value;
              });
            }
          },
        ),
        const SizedBox(height: 16),

        // Weekday Selector (for weekly recurrence)
        if (_recurrenceType == RecurrenceType.weekly)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Repeat on days:'),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(7, (index) {
                  // Day index is 1-7 (Monday-Sunday) for the model, but 0-6 for UI
                  final dayIndex = index + 1;
                  final isSelected = _selectedDays.contains(dayIndex);

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          // Don't allow deselecting all days
                          if (_selectedDays.length > 1) {
                            _selectedDays.remove(dayIndex);
                          }
                        } else {
                          _selectedDays.add(dayIndex);
                        }
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: isSelected
                          ? Theme.of(context).colorScheme.primary
                          : Colors.grey.shade200,
                      foregroundColor: isSelected
                          ? Theme.of(context).colorScheme.onPrimary
                          : Colors.grey.shade800,
                      radius: 20,
                      child: Text(weekdays[index]),
                    ),
                  );
                }),
              ),
            ],
          ),
      ],
    );
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      // Create event
      final event = _createEventFromForm();

      // Save event to repository

      await ref
          .read(countdownEventViewModelProvider.notifier)
          .createEvent(event);

      final action = widget.event != null ? 'updated' : 'created';
      ref.read(loggerProvider).info('Event $action: ${event.id}');
      if (mounted) {
        Navigator.of(context).pop();
      }
    } catch (e, stack) {
      ref.read(loggerProvider).error('Error saving event', e, stack);
      setState(() {
        _errorMessage = 'Unexpected error: $e';
        _isLoading = false;
      });
    }
  }

  CountdownEvent _createEventFromForm() {
    // Create the timing details based on event type
    final EventTimingDetails timing;

    if (_eventType == EventType.oneTime) {
      // Convert date and time to a single DateTime
      final eventDateTime = DateTime(
        _eventDate.year,
        _eventDate.month,
        _eventDate.day,
        _eventTime.hour,
        _eventTime.minute,
      );

      timing = EventTimingDetails.oneTime(
        eventTime: eventDateTime,
        timeZone: _timeZone,
      );
    } else {
      // For recurring events
      final pattern = RecurrencePattern(
        type: _recurrenceType,
        interval: 1, // Every X days/weeks/etc.
      );

      timing = EventTimingDetails.recurring(
        pattern: pattern,
        timeOfDay: _recurringTime,
        daysOfWeek: _selectedDays,
      );
    }

    if (widget.event != null) {
      // Update existing event
      return CountdownEvent(
        id: widget.event!.id,
        title: _titleController.text.trim(),
        notes: _notesController.text.trim().isEmpty
            ? null
            : _notesController.text.trim(),
        iconName: widget.event!.iconName,
        createdAt: widget.event!.createdAt,
        tags: widget.event!.tags,
        type: _eventType,
        timing: timing,
        notificationSettings: _notificationSettings,
        isArchived: widget.event!.isArchived,
      );
    } else {
      // Create new event
      return CountdownEvent.create(
        title: _titleController.text.trim(),
        notes: _notesController.text.trim().isEmpty
            ? null
            : _notesController.text.trim(),
        createdAt: DateTime.now(),
        type: _eventType,
        timing: timing,
        notificationSettings: _notificationSettings,
      );
    }
  }
}

// Extension to capitalize strings
extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
