// lib/presentation/widgets/notification_settings_form.dart
import 'package:countdown/domain/models/notification_settings/notification_settings.dart';
import 'package:flutter/material.dart';

class NotificationSettingsForm extends StatefulWidget {
  final NotificationSettings initialSettings;
  final ValueChanged<NotificationSettings> onSettingsChanged;

  const NotificationSettingsForm({
    super.key,
    required this.initialSettings,
    required this.onSettingsChanged,
  });

  @override
  State<NotificationSettingsForm> createState() =>
      _NotificationSettingsFormState();
}

class _NotificationSettingsFormState extends State<NotificationSettingsForm> {
  late bool _notificationsEnabled;
  late List<Duration> _selectedReminders;
  late NotificationSound _selectedSound;
  late bool _vibrateEnabled;
  late bool _snoozeEnabled;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  void _loadSettings() {
    final settings = widget.initialSettings;
    _notificationsEnabled = settings.enabled;
    _selectedReminders = List.from(settings.reminders);
    _selectedSound = settings.sound;
    _vibrateEnabled = settings.vibrate;
    _snoozeEnabled = settings.snoozeEnabled;
  }

  void _updateSettings() {
    final updatedSettings = NotificationSettings(
      enabled: _notificationsEnabled,
      reminders: _selectedReminders,
      sound: _selectedSound,
      vibrate: _vibrateEnabled,
      snoozeEnabled: _snoozeEnabled,
    );

    widget.onSettingsChanged(updatedSettings);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Main notification toggle
        SwitchListTile(
          title: const Text('Enable Notifications'),
          value: _notificationsEnabled,
          onChanged: (value) {
            setState(() {
              _notificationsEnabled = value;
              _updateSettings();
            });
          },
        ),

        if (_notificationsEnabled) ...[
          const Divider(),

          // Reminder selection
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Remind me:',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: [
                    _buildReminderChip(
                        NotificationReminders.fiveMinutes, '5 minutes before'),
                    _buildReminderChip(NotificationReminders.fifteenMinutes,
                        '15 minutes before'),
                    _buildReminderChip(NotificationReminders.thirtyMinutes,
                        '30 minutes before'),
                    _buildReminderChip(
                        NotificationReminders.oneHour, '1 hour before'),
                    _buildReminderChip(
                        NotificationReminders.threeHours, '3 hours before'),
                    _buildReminderChip(
                        NotificationReminders.oneDay, '1 day before'),
                  ],
                ),
                if (_selectedReminders.isEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'No reminders selected',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
              ],
            ),
          ),

          const Divider(),

          // Sound selection
          ListTile(
            title: const Text('Notification Sound'),
            subtitle: Text(_getSoundName(_selectedSound)),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: _showSoundPicker,
          ),

          // Vibration toggle
          SwitchListTile(
            title: const Text('Vibrate'),
            value: _vibrateEnabled,
            onChanged: (value) {
              setState(() {
                _vibrateEnabled = value;
                _updateSettings();
              });
            },
          ),

          // Snooze toggle
          SwitchListTile(
            title: const Text('Allow Snooze'),
            value: _snoozeEnabled,
            onChanged: (value) {
              setState(() {
                _snoozeEnabled = value;
                _updateSettings();
              });
            },
          ),

          // Preset selection
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Preset Reminder Patterns:',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: [
                    _buildPresetChip('Minimal', NotificationReminders.minimal),
                    _buildPresetChip(
                        'Standard', NotificationReminders.standard),
                    _buildPresetChip(
                        'Extended', NotificationReminders.extended),
                    _buildPresetChip(
                        'Comprehensive', NotificationReminders.comprehensive),
                  ],
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildReminderChip(Duration duration, String label) {
    final isSelected = _selectedReminders.contains(duration);

    return FilterChip(
      selected: isSelected,
      label: Text(label),
      onSelected: (selected) {
        setState(() {
          if (selected) {
            _selectedReminders.add(duration);
          } else {
            _selectedReminders.remove(duration);
          }
          _selectedReminders.sort((a, b) => b.compareTo(a)); // Sort descending
          _updateSettings();
        });
      },
    );
  }

  Widget _buildPresetChip(String label, List<Duration> preset) {
    return ActionChip(
      label: Text(label),
      onPressed: () {
        setState(() {
          _selectedReminders = List.from(preset);
          _updateSettings();
        });
      },
    );
  }

  void _showSoundPicker() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(
                  'Select Notification Sound',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              const Divider(),
              ...NotificationSound.values.map((sound) {
                return ListTile(
                  title: Text(_getSoundName(sound)),
                  trailing: sound == _selectedSound
                      ? Icon(Icons.check,
                          color: Theme.of(context).colorScheme.primary)
                      : null,
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      _selectedSound = sound;
                      _updateSettings();
                    });
                  },
                );
              }).toList(),
            ],
          ),
        );
      },
    );
  }

  String _getSoundName(NotificationSound sound) {
    switch (sound) {
      case NotificationSound.default_:
        return 'Default';
      case NotificationSound.gentle:
        return 'Gentle';
      case NotificationSound.urgent:
        return 'Urgent';
      case NotificationSound.bell:
        return 'Bell';
      case NotificationSound.chime:
        return 'Chime';
      case NotificationSound.silent:
        return 'Silent';
    }
  }
}
