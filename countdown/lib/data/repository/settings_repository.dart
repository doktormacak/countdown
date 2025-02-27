import 'package:countdown/utils/result.dart';
import 'package:flutter/material.dart';

abstract class SettingsRepository {
  Result<ThemeMode> getThemeMode();
  Future<Result<void>> setThemeMode(ThemeMode mode);
  Result<bool> getNotificationsEnabled();
  Future<Result<void>> setNotificationsEnabled(bool enabled);
  Result<bool> get24HourTimeEnabled();
  Future<Result<void>> set24HourTimeEnabled(bool enabled);
  Result<String> getDefaultTimeZone();
  Future<Result<void>> setDefaultTimeZone(String timeZone);
  Future<Result<void>> resetAllSettings();
}
