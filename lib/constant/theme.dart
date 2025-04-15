// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class AppColors {
  // ألوان الثيم الفاتح
  static const Color primaryColor = Color(0xFF25AE4B); // اللون الأخضر الرئيسي
  static const Color secondaryColor = Color(0xFF0F481F); // اللون الأخضر الداكن
  static const Color onBoardingtextColor = Color(0xFF455A64);
  static const Color primaryGreen = Color(0xFF25AE4B);
  static const Color backgroundLight = Colors.white;
  static const Color textPrimaryLight = Colors.black;
  static const Color textSecondaryLight = Color(0xFF757575);
  static const Color cardLight = Colors.white;
  static const Color inputBackgroundLight = Color(0xFFF5F5F5);
  static const Color iconColorLight = Colors.black;

  // ألوان الثيم الداكن
  static const Color backgroundDark = Color.fromARGB(255, 29, 29, 31);
  static const Color textPrimaryDark = Colors.white;
  static const Color textSecondaryDark = Color(0xFFBBBBBB);
  static const Color cardDark = Color.fromARGB(255, 49, 49, 51);
  static const Color inputBackgroundDark = Color.fromARGB(255, 49, 49, 51);
  static const Color iconColorDark = Color(0xFF25AE4B);
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryGreen,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryGreen,
      secondary: AppColors.primaryGreen,
      surface: AppColors.cardLight,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundLight,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.textPrimaryLight),
      titleTextStyle: TextStyle(
        color: AppColors.textPrimaryLight,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(color: AppColors.textPrimaryLight),
      displayMedium: TextStyle(color: AppColors.textPrimaryLight),
      displaySmall: TextStyle(color: AppColors.textPrimaryLight),
      headlineMedium: TextStyle(color: AppColors.textPrimaryLight),
      headlineSmall: TextStyle(color: AppColors.textPrimaryLight),
      titleLarge: TextStyle(color: AppColors.textPrimaryLight),
      titleMedium: TextStyle(color: AppColors.textPrimaryLight),
      titleSmall: TextStyle(color: AppColors.textPrimaryLight),
      bodyLarge: TextStyle(color: AppColors.textPrimaryLight),
      bodyMedium: TextStyle(color: AppColors.textPrimaryLight),
      bodySmall: TextStyle(color: AppColors.textSecondaryLight),
      labelLarge: TextStyle(color: AppColors.textPrimaryLight),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.inputBackgroundLight,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.primaryGreen),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryGreen,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        minimumSize: Size(double.infinity, 50),
      ),
    ),
    cardTheme: CardTheme(
      color: AppColors.cardLight,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.textSecondaryLight.withOpacity(0.5);
          }
          if (states.contains(MaterialState.pressed)) {
            return AppColors.primaryGreen;
          }
          if (states.contains(MaterialState.hovered)) {
            return AppColors.primaryGreen.withOpacity(0.8);
          }
          if (states.contains(MaterialState.focused)) {
            return AppColors.primaryGreen;
          }
          return AppColors.iconColorLight;
        }),
        overlayColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.pressed)) {
            return AppColors.primaryGreen.withOpacity(0.1);
          }
          if (states.contains(MaterialState.hovered)) {
            return AppColors.primaryGreen.withOpacity(0.05);
          }
          return Colors.transparent;
        }),
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        iconSize: MaterialStateProperty.all(24.0),
        padding: MaterialStateProperty.all(EdgeInsets.all(8.0)),
        alignment: Alignment.center,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.backgroundLight,
      selectedItemColor: AppColors.primaryGreen,
      unselectedItemColor: AppColors.textSecondaryLight,
      selectedIconTheme: IconThemeData(
        color: AppColors.primaryGreen,
        size: 24.0,
      ),
      unselectedIconTheme: IconThemeData(
        color: AppColors.textSecondaryLight,
        size: 22.0,
      ),
      selectedLabelStyle: TextStyle(
        color: AppColors.primaryGreen,
        fontSize: 12.0,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: TextStyle(
        color: AppColors.textSecondaryLight,
        fontSize: 11.0,
        fontWeight: FontWeight.normal,
      ),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      elevation: 8.0,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryGreen,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    colorScheme: ColorScheme.dark(
      primary: AppColors.primaryGreen,
      secondary: AppColors.primaryGreen,
      // ignore: deprecated_member_use
      background: AppColors.backgroundDark,
      surface: AppColors.cardDark,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundDark,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.textPrimaryDark),
      titleTextStyle: TextStyle(
        color: AppColors.textPrimaryDark,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(color: AppColors.textPrimaryDark),
      displayMedium: TextStyle(color: AppColors.textPrimaryDark),
      displaySmall: TextStyle(color: AppColors.textPrimaryDark),
      headlineMedium: TextStyle(color: AppColors.textPrimaryDark),
      headlineSmall: TextStyle(color: AppColors.textPrimaryDark),
      titleLarge: TextStyle(color: AppColors.textPrimaryDark),
      titleMedium: TextStyle(color: AppColors.textPrimaryDark),
      titleSmall: TextStyle(color: AppColors.textPrimaryDark),
      bodyLarge: TextStyle(color: AppColors.textPrimaryDark),
      bodyMedium: TextStyle(color: AppColors.textPrimaryDark),
      bodySmall: TextStyle(color: AppColors.textSecondaryDark),
      labelLarge: TextStyle(color: AppColors.textPrimaryDark),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.inputBackgroundDark,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.primaryGreen),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryGreen,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        minimumSize: Size(double.infinity, 50),
      ),
    ),
    cardTheme: CardTheme(
      color: AppColors.cardDark,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.textSecondaryDark.withOpacity(0.5);
          }
          if (states.contains(MaterialState.pressed)) {
            return AppColors.primaryGreen;
          }
          if (states.contains(MaterialState.hovered)) {
            return AppColors.primaryGreen.withOpacity(0.8);
          }
          if (states.contains(MaterialState.focused)) {
            return AppColors.primaryGreen;
          }
          return AppColors.iconColorDark;
        }),
        overlayColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.pressed)) {
            return AppColors.primaryGreen.withOpacity(0.2);
          }
          if (states.contains(MaterialState.hovered)) {
            return AppColors.primaryGreen.withOpacity(0.1);
          }
          return Colors.transparent;
        }),
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        iconSize: MaterialStateProperty.all(24.0),
        padding: MaterialStateProperty.all(EdgeInsets.all(8.0)),
        alignment: Alignment.center,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.backgroundDark,
      selectedItemColor: AppColors.primaryGreen,
      unselectedItemColor: AppColors.textSecondaryDark,
      selectedIconTheme: IconThemeData(
        color: AppColors.primaryGreen,
        size: 24.0,
      ),
      unselectedIconTheme: IconThemeData(
        color: AppColors.textSecondaryDark,
        size: 22.0,
      ),
      selectedLabelStyle: TextStyle(
        color: AppColors.primaryGreen,
        fontSize: 12.0,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: TextStyle(
        color: AppColors.textSecondaryDark,
        fontSize: 11.0,
        fontWeight: FontWeight.normal,
      ),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      elevation: 8.0,
    ),
  );
}
