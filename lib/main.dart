import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek_project/constant/functions/bloc_observer.dart';
import 'package:foodtek_project/constant/theme.dart';
import 'package:foodtek_project/cubit/theme_cubit.dart';
import 'package:foodtek_project/state/theme_state.dart';
import 'package:foodtek_project/view/screens/explore_screen.dart';
import 'package:foodtek_project/view/screens/home/cart/checkout/Checkout_Screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:foodtek_project/l10n/generated/app_localizations.dart';
import 'package:foodtek_project/model/user_profile_model.dart';
import 'package:foodtek_project/view/screens/home/favorites/favorite_screen.dart';
import 'package:foodtek_project/view/screens/home/home/home_screen.dart';
import 'package:foodtek_project/view/widgets/product_card.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'cubit/home/favorites/add_remove_favorite_cubit.dart';
import 'cubit/home/favorites/favorite_cubit.dart';
import 'cubit/home/get_all_category_cubit.dart';
import 'model/product_model.dart';

void main() {
  runApp(const MyApp());
  Bloc.observer = MyBlocObserver();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en');

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }
  void onFavoritePressed() {
    print('Favorite toggled');
  }

  void onOrderPressed() {
    print('Order pressed');
  }


  @override
  Widget build(BuildContext context) {
    UserProfile driverProfile = UserProfile(
      userId: '1',
      name: 'Driver Name',
      address: '123 Driver Street',
      location: LatLng(32.01517354972322, 35.86903660207451),
      profileImageUrl: 'https://www.example.com/driver.jpg',
      phoneNumber: '0780111111',
    );

    UserProfile userProfile = UserProfile(
      userId: '2',
      name: 'User Name',
      address: '456 User Avenue',
      location: LatLng(31.98801277328986, 35.89498906471146),
      profileImageUrl: 'https://www.example.com/user.jpg',
      phoneNumber: '078011111',
    );

    final product = Product(
      id: '123',
      name: 'Pizza Margherita',
      description: 'Delicious cheese and tomato pizza',
      price: 9.99,
      imageUrl: 'https://images.unsplash.com/photo-1601924928376-b4f87c1a17a1',
      isFavorite: false,
      cartDescription: "",
      detailedDescription: ""

    );

    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => AppCubit()),
        BlocProvider(
          create: (context) =>FavoritesCubit(userProfile.userId)..fetchFavorites(),
        ),
        BlocProvider(
          create: (context) {
            final cubit = CategoryCubit();
            cubit.fetchCategories();
            return cubit;
          },
        ),
    BlocProvider(
      create: (context) => AddRemoveFavoriteCubit(userId: userProfile.userId),),],
      child: ScreenUtilInit(
        designSize: const Size(428, 926),
        splitScreenMode: true,
        builder: (context, child) {
          return BlocBuilder<AppCubit, AppStates>(
            builder:
                (context, state) => MaterialApp(
                  theme: AppTheme.lightTheme,
                  darkTheme: AppTheme.darkTheme,
                  themeMode: context.read<AppCubit>().themeMode,

                  locale: context.read<AppCubit>().locale,
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: const [Locale('en'), Locale('ar')],
                  debugShowCheckedModeBanner: false,
                  title: 'FoodTek',
                  home: ExploreScreen(),
                  builder: (context, child) {
                    return Directionality(
                      textDirection:
                          context.read<AppCubit>().locale.toString() == "en"
                              ? TextDirection.ltr
                              : TextDirection.rtl,
                      child: child!,
                    );
                  },
                ),
          );
        },
      ),
    );
  }
}
