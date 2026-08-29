import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  static const String _themePrefKey = 'app_theme_mode';
  final SharedPreferences? _prefs;

  ThemeCubit([this._prefs]) : super(_resolveInitialTheme(_prefs));

  static ThemeMode _resolveInitialTheme(SharedPreferences? prefs) {
    if (prefs == null) return ThemeMode.light;
    final savedTheme = prefs.getString(_themePrefKey);
    switch (savedTheme) {
      case 'dark':
        return ThemeMode.dark;
      case 'light':
        return ThemeMode.light;
      case 'system':
        return ThemeMode.system;
      default:
        return ThemeMode.light;
    }
  }

  /// Helper to get the saved theme mode prior to runApp
  static Future<ThemeMode> getSavedTheme() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return _resolveInitialTheme(prefs);
    } catch (_) {
      return ThemeMode.light;
    }
  }

  /// Loads saved theme mode from SharedPreferences if not already initialized
  Future<void> loadTheme() async {
    try {
      final prefs = _prefs ?? await SharedPreferences.getInstance();
      final savedTheme = prefs.getString(_themePrefKey);
      if (savedTheme != null) {
        final mode = savedTheme == 'dark'
            ? ThemeMode.dark
            : savedTheme == 'system'
                ? ThemeMode.system
                : ThemeMode.light;
        if (state != mode) {
          emit(mode);
        }
      }
    } catch (_) {}
  }

  /// Toggles between light and dark modes and saves preference
  Future<void> toggleTheme() async {
    final newMode = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    emit(newMode);
    await _saveTheme(newMode);
  }

  /// Sets a specific theme mode and saves preference
  Future<void> setTheme(ThemeMode themeMode) async {
    emit(themeMode);
    await _saveTheme(themeMode);
  }

  Future<void> _saveTheme(ThemeMode themeMode) async {
    try {
      final prefs = _prefs ?? await SharedPreferences.getInstance();
      final value = themeMode == ThemeMode.dark
          ? 'dark'
          : themeMode == ThemeMode.system
              ? 'system'
              : 'light';
      await prefs.setString(_themePrefKey, value);
    } catch (e) {
      debugPrint('Error saving theme to SharedPreferences: $e');
    }
  }
}
