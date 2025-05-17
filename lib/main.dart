
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek_project/constant/functions/bloc_observer.dart';
import 'package:foodtek_project/constant/theme.dart';
import 'package:foodtek_project/cubit/notification/notification_cubit.dart';
import 'package:foodtek_project/cubit/recommended_item/recommended_item_cubit.dart';
import 'package:foodtek_project/cubit/theme_cubit.dart';
import 'package:foodtek_project/cubit/top_rated/top_rated_cubit.dart';
import 'package:foodtek_project/data/item_repository.dart';
import 'package:foodtek_project/data/notification_repository.dart';
import 'package:foodtek_project/data/recommended_item_repository.dart';
import 'package:foodtek_project/services/notification_service.dart';
import 'package:foodtek_project/services/recommended_item_service.dart';
import 'package:foodtek_project/state/theme_state.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:foodtek_project/l10n/generated/app_localizations.dart';
import 'package:foodtek_project/model/user_profile_model.dart';
import 'package:foodtek_project/view/screens/splash_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'cubit/home/favorites/add_remove_favorite_cubit.dart';
import 'cubit/home/favorites/favorite_cubit.dart';
import 'cubit/home/get_all_category_cubit.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
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


return MultiRepositoryProvider(
  providers: [
    RepositoryProvider<ItemRepository>(
      create: (context) => ItemRepository(),
    ),
  RepositoryProvider<NotificationApiService>(
      create: (_) => NotificationApiService(),
    ),
    RepositoryProvider<NotificationRepository>(
      create: (context) => NotificationRepository(
        context.read<NotificationApiService>(),
      ),
    )
  ],      
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AppCubit(),
          ),
          BlocProvider(
          create: (context) => CategoryCubit()..fetchCategories(),),

          BlocProvider(
            create: (context) => FavoritesCubit(userProfile.userId)..fetchFavorites(),),

          BlocProvider(
              create: (_) => AddRemoveFavoriteCubit(userId: userProfile.userId)),

          BlocProvider(
            create: (context) => TopRatedCubit(
              context.read<ItemRepository>(),
            ),
            
          ),
           BlocProvider(
      create: (context) => RecommendedItemCubit(
        RecommendedItemRepository(RecommendedItemService()),
      ),
           ),
             BlocProvider(
            create: (context) => NotificationCubit(
              context.read<NotificationRepository>(),
            ),
             )
        ],
        child: ScreenUtilInit(
          designSize: const Size(428, 926),
          splitScreenMode: true,
          builder: (context, child) {
            return BlocBuilder<AppCubit, AppStates>(
              builder: (context, state) => MaterialApp(
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
                home: SplashScreen(),
                builder: (context, child) {
                  return Directionality(
                    textDirection: context.read<AppCubit>().locale.toString() == "en"
                        ? TextDirection.ltr
                        : TextDirection.rtl,
                    child: child!,
                  );
                },
              ),
            );
          },
    )));
  }
}
  