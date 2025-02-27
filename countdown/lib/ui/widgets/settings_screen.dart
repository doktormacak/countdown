// lib/presentation/screens/settings_screen.dart
import 'package:countdown/ui/view_model/theme/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          // Theme settings
          const _SectionHeader('Appearance'),
          _buildThemeSelector(context, ref),

          const Divider(),

          // Notification settings
          const _SectionHeader('Notifications'),
          SwitchListTile(
            title: const Text('Enable Notifications'),
            subtitle: const Text('Receive alerts for upcoming events'),
            value: true, // TODO: Connect to a provider for this setting
            onChanged: (value) {
              // TODO: Implement setting change
            },
          ),

          ListTile(
            title: const Text('Default Notification Times'),
            subtitle: const Text('Set default reminder times for new events'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // TODO: Navigate to notification presets screen
            },
          ),

          ListTile(
            title: const Text('Notification Sounds'),
            subtitle: const Text('Choose default sound for notifications'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // TODO: Navigate to notification sounds screen
            },
          ),

          const Divider(),

          // Time settings
          const _SectionHeader('Time Settings'),
          ListTile(
            title: const Text('Default Time Zone'),
            subtitle: const Text('UTC'), // TODO: Get from settings
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // TODO: Show timezone selector
            },
          ),

          SwitchListTile(
            title: const Text('24-Hour Time'),
            subtitle: const Text('Display time in 24-hour format'),
            value: false, // TODO: Connect to a provider for this setting
            onChanged: (value) {
              // TODO: Implement setting change
            },
          ),

          const Divider(),

          // About section
          const _SectionHeader('About'),
          const ListTile(
            title: Text('Version'),
            subtitle: Text('1.0.0'),
          ),

          ListTile(
            title: const Text('Help & Feedback'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // TODO: Navigate to help screen
            },
          ),

          // Danger zone
          const Divider(),
          const _SectionHeader('Danger Zone', color: Colors.red),

          ListTile(
            title: const Text('Reset All Settings'),
            textColor: Colors.red,
            trailing: const Icon(Icons.restore, color: Colors.red),
            onTap: () {
              _showResetConfirmationDialog(context, ref);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildThemeSelector(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Theme Mode'),
          const SizedBox(height: 8),
          SegmentedButton<ThemeMode>(
            segments: const [
              ButtonSegment(
                value: ThemeMode.light,
                label: Text('Light'),
                icon: Icon(Icons.light_mode),
              ),
              ButtonSegment(
                value: ThemeMode.system,
                label: Text('System'),
                icon: Icon(Icons.auto_mode),
              ),
              ButtonSegment(
                value: ThemeMode.dark,
                label: Text('Dark'),
                icon: Icon(Icons.dark_mode),
              ),
            ],
            selected: {
              ref.watch(themeViewModelProvider).valueOrNull ?? ThemeMode.system
            }, // TODO: Connect to actual theme provider
            onSelectionChanged: (selection) {
              ref
                  .read(themeViewModelProvider.notifier)
                  .setThemeMode(selection.first);
            },
          ),
        ],
      ),
    );
  }

  void _showResetConfirmationDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Reset Settings?'),
        content: const Text(
            'This will reset all settings to default values. This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('CANCEL'),
          ),
          TextButton(
            onPressed: () {
              // TODO: Implement settings reset
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Settings have been reset to defaults')),
              );
            },
            child: const Text('RESET'),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final Color? color;

  const _SectionHeader(this.title, {this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: color ?? Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
