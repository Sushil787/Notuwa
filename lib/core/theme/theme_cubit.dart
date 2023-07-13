import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuraa/core/constants/app_constants.dart';
import 'package:kuraa/di/di_setup.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Theme cubit
enum ThemeState {
  /// Light theme
  light,

  /// Dark Theme
  dark
}

/// Theme Cubit
class ThemeCubit extends Cubit<ThemeState> {
  /// Public Constructor
  ThemeCubit() : super(ThemeState.dark) {
    _loadTheme();
  }

  /// Local Storage Theme
  final themeStorage = getIt<SharedPreferences>();

  /// Set Theme
  Future<void> setTheme({required bool isDark}) async {
    await themeStorage.setBool(AppConstants.themeKey, isDark);
  }

  /// Load theme
  Future<void> _loadTheme() async {
    final isDark = themeStorage.getBool(AppConstants.themeKey) ?? false;
    isDark ? emit(ThemeState.dark) : emit(ThemeState.light);
  }

  /// Toggle Theme
  Future<void> toggleTheme() async {
    var isDark = themeStorage.getBool(AppConstants.themeKey) ?? false;
    isDark = !isDark;
    await setTheme(isDark: isDark);
    log(isDark.toString());
    isDark ? emit(ThemeState.dark) : emit(ThemeState.light);
  }
}
