import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek_project/constant/main_screens/main_screen_data.dart';
import 'package:foodtek_project/constant/theme.dart';
import 'package:foodtek_project/state/nav_bar_state.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class NavBarCubit extends Cubit<NavBarStates> {
  NavBarCubit() : super(InitNavBareState());

  late PersistentTabController controller = PersistentTabController(
    initialIndex: 0,
  );

  change() {
    controller.addListener(() {});
    emit(ChangeNavBareState());
  }

  List<Widget> buildScreens() {
    return pages;
  }

  List<PersistentBottomNavBarItem> navBarsItems(BuildContext context) {
    return List.generate(5, (index) {
      bool isCart = index == 2;
      return PersistentBottomNavBarItem(
        icon:
            isCart
                ? Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Center(
                    child: Icon(
                      bottomNavIcons[index],
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                )
                : Icon(bottomNavIcons[index]),
        title: bottomNavLabels(context)[index],
        textStyle: TextStyle(
          color:
              index == context.read<NavBarCubit>().controller.index
                  ? AppColors.primaryColor
                  : Colors.grey,
        ),
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: Colors.grey,
      );
    });
  }
}
