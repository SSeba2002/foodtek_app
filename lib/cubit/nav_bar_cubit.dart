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

  bool hasActiveOrder = false;

  void change() {
    controller.addListener(() {
      emit(ChangeNavBareState());
    });
  }

  void setActiveOrder(bool value) {
    // method to change the state
    hasActiveOrder = value;
    emit(ChangeNavBareState());
  }

  // the function to change Icon
  void toggleHistoryToTrack() {
    hasActiveOrder = !hasActiveOrder;
    emit(ChangeNavBareState());
  }

  List<Widget> buildScreens(BuildContext context) {
    return buildPages(context);
  }

  List<PersistentBottomNavBarItem> navBarsItems(BuildContext context) {
    return List.generate(5, (index) {
      bool isCart = index == 2;
      bool isHistory = index == 3;

      return PersistentBottomNavBarItem(
        icon:
            isCart
                ? Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: Center(
                    child: Icon(
                      bottomNavIcons[index],
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                )
                : Icon(
                  isHistory && hasActiveOrder
                      ? Icons
                          .location_on_outlined // Track icon if has avtive order
                      : bottomNavIcons[index],
                ),
        title: bottomNavLabels(context)[index],
        textStyle: TextStyle(
          color:
              index == controller.index ? AppColors.primaryColor : Colors.grey,
        ),
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: Colors.grey,
      );
    });
  }
}
