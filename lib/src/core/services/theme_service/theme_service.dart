// lib/services/theme_service.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class ThemeService extends GetxService {
  static const _themeKey = 'themeMode';

  ThemeMode _themeMode = ThemeMode.system;
  final SharedPreferences _prefs;

  /// current theme
  ThemeMode get themeMode => _themeMode;

  ThemeService(SharedPreferences prefs) : _prefs = prefs;

  /// init theme when app starts
  Future<ThemeService> initTheme() async {
    final saved = _prefs.getString(_themeKey);

    _themeMode = _stringToThemeMode(saved);
    // apply to app
    Get.changeThemeMode(_themeMode);

    return this;
  }

  /// set & persist theme
  Future<void> setTheme(ThemeMode mode) async {
    _themeMode = mode;

    // apply to app
    Get.changeThemeMode(mode);

    await _prefs.setString(_themeKey, _themeModeToString(mode));
  }

  /// just return current theme
  ThemeMode getTheme() => _themeMode;

  // helpers
  ThemeMode _stringToThemeMode(String? value) {
    switch (value) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  String _themeModeToString(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      default:
        return 'system';
    }
  }
}
