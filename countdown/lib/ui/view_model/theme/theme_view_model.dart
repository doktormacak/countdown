import 'package:countdown/data/repository/settings_repository_impl.dart';
import 'package:countdown/data/services/logger_service.dart';
import 'package:countdown/utils/result.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_view_model.g.dart';

@Riverpod(keepAlive: true)
class ThemeViewModel extends _$ThemeViewModel {
  @override
  FutureOr<ThemeMode> build() async {
    final repository = ref.watch(settingsRepositoryProvider);
    final _logger = ref.watch(loggerProvider);
    final themeMode = repository.getThemeMode();
    return themeMode.fold((themeMode) {
      state = AsyncData(themeMode);
      return themeMode;
    }, (e) {
      state = AsyncError(e, StackTrace.current);
      return ThemeMode.system;
    });
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    if (state.valueOrNull == mode) return;

    state = const AsyncLoading();

    try {
      final repository = ref.read(settingsRepositoryProvider);
      ref.read(loggerProvider).info('Setting theme mode to: $mode');
      await repository.setThemeMode(mode);
      state = AsyncData(mode);
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
    }
  }

  Future<void> toggleThemeMode() async {
    final currentMode = state.valueOrNull ?? ThemeMode.system;

    final newMode = switch (currentMode) {
      ThemeMode.light => ThemeMode.dark,
      ThemeMode.dark => ThemeMode.light,
      ThemeMode.system => ThemeMode.light,
    };

    await setThemeMode(newMode);
  }
}
