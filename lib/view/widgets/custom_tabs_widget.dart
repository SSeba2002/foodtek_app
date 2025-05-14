import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

class CustomTabs extends StatefulWidget {
  final TabController tabController;

  const CustomTabs({super.key, required this.tabController});

  @override
  _CustomTabsState createState() => _CustomTabsState();
}

class _CustomTabsState extends State<CustomTabs> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: ButtonsTabBar(
        controller: widget.tabController,
        backgroundColor: Color.fromRGBO(37, 174, 75, 1),
        unselectedBackgroundColor: Colors.white,
        borderWidth: 2,
        borderColor: Color.fromRGBO(133, 222, 158, 1),
        unselectedBorderColor: Color.fromRGBO(133, 222, 158, 1),
        labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        radius: 7,

        tabs: [
          Tab(child: Text("All")),
          Tab(
            child: Row(
              children: [
                Image.asset("assets/tabs/burger.png"),
                SizedBox(width: 8),
                Text("Burger"),
              ],
            ),
          ),
          Tab(
            child: Row(
              children: [
                Image.asset("assets/tabs/pizza.png"),
                SizedBox(width: 8),
                Text("Pizza"),
              ],
            ),
          ),
          Tab(
            child: Row(
              children: [
                Image.asset("assets/tabs/sandwich.png"),
                SizedBox(width: 8),
                Text("Sandwich"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
