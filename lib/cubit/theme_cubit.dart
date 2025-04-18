// lib/cubit/theme/theme_cubit.dart
import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek_project/state/theme_state.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(IntiThemeState()) {
    loadTheme();
  }

  String? selectedLanguage = 'English';
  bool isDarkMode = false;
  ThemeMode themeMode = ThemeMode.light;
  Locale locale = Locale('en');

  changeLang(String lang) {
    locale = Locale(lang);
    emit(ChangeLangState());
  }

  // تحميل السمة من التخزين المحلي
  Future<void> loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool('isDarkMode') ?? false;

    if (isDarkMode) {
      themeMode = ThemeMode.dark;
      emit(DarkThemeState());
    } else {
      themeMode = ThemeMode.light;
      emit(LightThemeState());
    }
  }

  // تغيير السمة
  Future<void> changeTheme({required bool isDarkMode}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDarkMode);

    if (isDarkMode) {
      themeMode = ThemeMode.dark;
      emit(DarkThemeState());
    } else {
      themeMode = ThemeMode.light;
      emit(LightThemeState());
    }
  }

  // تبديل السمة (من فاتح إلى داكن أو العكس)
  Future<void> toggleTheme() async {
    await changeTheme(isDarkMode: !isDarkMode);
  }
}
