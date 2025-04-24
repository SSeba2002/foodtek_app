// main screen data
import 'package:flutter/material.dart';
import 'package:foodtek_project/l10n/generated/app_localizations.dart';
import 'package:foodtek_project/view/screens/home/cart/main_cart_screen.dart';
import 'package:foodtek_project/view/screens/home/favorites/favorite_screen.dart';
import 'package:foodtek_project/view/screens/home/history/empty_history_screen.dart';
import 'package:foodtek_project/view/screens/home/home/home_screen.dart';
import 'package:foodtek_project/view/screens/home/profile/profile_screen.dart';

List<String> bottomNavLabels(BuildContext context) {
  return [
    AppLocalizations.of(context)!.home,
    AppLocalizations.of(context)!.favorites,
    AppLocalizations.of(context)!.history,
    AppLocalizations.of(context)!.profile,
  ];
}

final List<IconData> bottomNavIcons = [
  Icons.home,
  Icons.favorite_border_outlined,
  Icons.shopping_cart_outlined,
  Icons.history,
  Icons.person,
];
final List<Widget> pages = [
  HomeScreen(),
  FavoritesScreen(),
  MainCartPage(),
  EmptyHistoryScreen(),
  //HistoryScreen(locationBar: true),
  const ProfileScreen(),
];
