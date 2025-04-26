import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek_project/cubit/nav_bar_cubit.dart';
import 'package:foodtek_project/state/nav_bar_state.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit(),
      child: BlocConsumer<NavBarCubit, NavBarStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return PersistentTabView(
            padding: EdgeInsets.all(5),
            navBarHeight: 60,
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor!,
            context,
            controller: context.read<NavBarCubit>().controller,
            screens: context.read<NavBarCubit>().buildScreens(context),
            items: context.read<NavBarCubit>().navBarsItems(context),
            navBarStyle: NavBarStyle.style15,
            confineToSafeArea: true,
            handleAndroidBackButtonPress: true,
            resizeToAvoidBottomInset: true,
          );
        },
      ),
    );
  }
}
