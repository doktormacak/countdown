// lib/data/repositories/preferences_settings_repository.dart
import 'package:countdown/data/repository/settings_repository.dart';
import 'package:countdown/data/services/logger_service.dart';
import 'package:countdown/data/services/shared_preferences.dart';
import 'package:countdown/utils/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_repository_impl.g.dart';

class PreferencesSettingsRepository implements SettingsRepository {
  static const String _themeKey = 'theme_mode';
  static const String _notificationsKey = 'notifications_enabled';
  static const String _militaryTimeKey = '24hour_time_enabled';
  static const String _timeZoneKey = 'default_time_zone';

  final SharedPreferences _prefs;
  final LoggerService _logger;

  PreferencesSettingsRepository(this._prefs, this._logger);

  @override
  Result<ThemeMode> getThemeMode() {
    try {
      final themeString = _prefs.getString(_themeKey);
      _logger.info('Theme mode: $themeString');
      switch (themeString) {
        case 'light':
          return const Result.ok(ThemeMode.light);
        case 'dark':
          return const Result.ok(ThemeMode.dark);
        default:
          return const Result.ok(ThemeMode.system);
      }
    } catch (e) {
      _logger.error('Failed to get theme mode', e);
      return Result.error(Exception('Failed to get theme mode'));
    }
  }

  @override
  Future<Result<void>> setThemeMode(ThemeMode mode) async {
    try {
      String modeString;
      switch (mode) {
        case ThemeMode.light:
          modeString = 'light';
          break;
        case ThemeMode.dark:
          modeString = 'dark';
          break;
        default:
          modeString = 'system';
          break;
      }

      await _prefs.setString(_themeKey, modeString);
      _logger.info('Theme mode set to: $modeString');
      return const Result.ok(null);
    } catch (e) {
      _logger.error('Failed to set theme mode', e);
      return Result.error(Exception('Failed to set theme mode'));
    }
  }

  @override
  Result<bool> getNotificationsEnabled() {
    try {
      final isNotificationEnabled = _prefs.getBool(_notificationsKey) ?? true;
      _logger.info(
          'Notifications ${isNotificationEnabled ? 'enabled' : 'disabled'}');
      return Result.ok(isNotificationEnabled);
    } catch (e) {
      _logger.error('Failed to get notifications enabled setting', e);
      return Result.error(Exception('Failed to get notifications setting'));
    }
  }

  @override
  Future<Result<void>> setNotificationsEnabled(bool enabled) async {
    try {
      await _prefs.setBool(_notificationsKey, enabled);
      _logger.info('Notifications ${enabled ? 'enabled' : 'disabled'}');
      return const Result.ok(null);
    } catch (e) {
      _logger.error('Failed to set notifications enabled', e);
      return Result.error(Exception('Failed to set notifications setting'));
    }
  }

  @override
  Result<bool> get24HourTimeEnabled() {
    try {
      final bool isEnabled = _prefs.getBool(_militaryTimeKey) ?? false;
      _logger
          .info('Notifications ${isEnabled ? '24-hour time' : '12-hour time'}');
      return Result.ok(isEnabled);
    } catch (e) {
      _logger.error('Failed to get 24-hour time setting', e);
      return Result.error(Exception('Failed to get 24-hour time setting'));
    }
  }

  @override
  Future<Result<void>> set24HourTimeEnabled(bool enabled) async {
    try {
      await _prefs.setBool(_militaryTimeKey, enabled);
      _logger.info('24-hour time format ${enabled ? 'enabled' : 'disabled'}');
      return const Result.ok(null);
    } catch (e) {
      _logger.error('Failed to set 24-hour time format', e);
      return Result.error(Exception('Failed to set 24-hour time format'));
    }
  }

  @override
  Result<String> getDefaultTimeZone() {
    try {
      final String timeZone = _prefs.getString(_timeZoneKey) ?? 'UTC';
      _logger.info('Default time zone: $timeZone');
      return Result.ok(timeZone);
    } catch (e) {
      _logger.error('Failed to get default time zone', e);
      return Result.error(Exception('Failed to get default time zone'));
    }
  }

  @override
  Future<Result<void>> setDefaultTimeZone(String timeZone) async {
    try {
      await _prefs.setString(_timeZoneKey, timeZone);
      _logger.info('Default time zone set to: $timeZone');
      return const Result.ok(null);
    } catch (e) {
      _logger.error('Failed to set default time zone', e);
      return Result.error(Exception('Failed to set default time zone'));
    }
  }

  @override
  Future<Result<void>> resetAllSettings() async {
    try {
      await _prefs.remove(_themeKey);
      await _prefs.remove(_notificationsKey);
      await _prefs.remove(_militaryTimeKey);
      await _prefs.remove(_timeZoneKey);
      _logger.info('All settings reset to defaults');
      return const Result.ok(null);
    } catch (e) {
      _logger.error('Failed to reset settings', e);
      return Result.error(Exception('Failed to reset settings'));
    }
  }
}

@Riverpod(keepAlive: true)
SettingsRepository settingsRepository(Ref ref) {
  final prefs = ref.watch(sharedPreferencesProvider).requireValue;
  final logger = ref.watch(loggerProvider);
  return PreferencesSettingsRepository(prefs, logger);
}
