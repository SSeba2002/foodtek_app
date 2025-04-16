// lib/cubit/theme/theme_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek_project/state/theme_state.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(IntiThemeState()) {
    loadTheme();
  }

  // تحميل السمة من التخزين المحلي
  Future<void> loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool('isDarkMode') ?? false;

    if (isDarkMode) {
      emit(DarkThemeState());
    } else {
      emit(LightThemeState());
    }
  }

  // تغيير السمة
  Future<void> changeTheme(bool isDarkMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDarkMode);

    if (isDarkMode) {
      emit(DarkThemeState());
    } else {
      emit(LightThemeState());
    }
  }

  // تبديل السمة (من فاتح إلى داكن أو العكس)
  Future<void> toggleTheme() async {
    await changeTheme(!state.isDarkMode);
  }
}
