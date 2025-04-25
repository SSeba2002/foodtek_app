import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek_project/l10n/generated/app_localizations.dart';
import 'package:foodtek_project/view/screens/home/cart/main_cart_screen.dart';
import 'package:foodtek_project/view/screens/home/cart/tracking/order_details_screen.dart';
import 'package:foodtek_project/view/screens/home/favorites/favorite_screen.dart';
import 'package:foodtek_project/view/screens/home/history/empty_history_screen.dart';
import 'package:foodtek_project/view/screens/home/home/home_screen.dart';
import 'package:foodtek_project/view/screens/home/profile/profile_screen.dart';
import 'package:foodtek_project/cubit/nav_bar_cubit.dart'; 

List<String> bottomNavLabels(BuildContext context) {
  final navBarCubit = context.read<NavBarCubit>();  

  return [
    AppLocalizations.of(context)!.home,
    AppLocalizations.of(context)!.favorites,
    AppLocalizations.of(context)!.cart,
    navBarCubit.hasActiveOrder
        ? AppLocalizations.of(context)!.track
        : AppLocalizations.of(context)!.history,
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


List<Widget> buildPages(BuildContext context) {
  final navBarCubit = context.read<NavBarCubit>();

  return [
    HomeScreen(),
    FavoritesScreen(),
    MainCartPage(),
    navBarCubit.hasActiveOrder
        ? OrderDetailsScreen()  
        : EmptyHistoryScreen(),  
    const ProfileScreen(),
  ];
}

