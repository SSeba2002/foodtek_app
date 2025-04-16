import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek_project/constant/theme.dart';
import 'package:foodtek_project/view/screens/auth/login_screen.dart';
import 'package:foodtek_project/view/screens/main_screen.dart';
import 'package:foodtek_project/view/screens/splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:foodtek_project/l10n/generated/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en'); // default lang

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.light,

          locale: _locale, // The language selected by the user
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('en'), Locale('ar')],
          debugShowCheckedModeBanner: false,
          title: 'FoodTek',
          home: LoginScreen(),
          //SplashScreen(setLocale: setLocale),
          builder: (context, child) {
            return Directionality(
              textDirection:
                  _locale.languageCode == 'ar'
                      ? TextDirection.rtl
                      : TextDirection.ltr,
              child: child!,
            );
          },
        );
      },
    );
  }
}
