// lib/cubit/theme/theme_state.dart

import 'package:flutter/material.dart';

abstract class AppStates {
  bool isDarkMode;
  ThemeMode themeMode;

  AppStates({required this.isDarkMode, required this.themeMode});
}

class IntiThemeState extends AppStates {
  IntiThemeState() : super(isDarkMode: false, themeMode: ThemeMode.light);
}

class LightThemeState extends AppStates {
  LightThemeState() : super(isDarkMode: false, themeMode: ThemeMode.light);
}

class DarkThemeState extends AppStates {
  DarkThemeState() : super(isDarkMode: true, themeMode: ThemeMode.dark);
}
