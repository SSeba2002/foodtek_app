import 'package:flutter/material.dart';
import 'package:foodtek_project/view/screens/burger_screen.dart';
import 'package:foodtek_project/view/screens/cart_screen.dart';
import 'package:foodtek_project/view/screens/favorite_screen.dart';
import 'package:foodtek_project/view/screens/history_screen.dart';
import 'package:foodtek_project/view/screens/home_screen.dart';
import 'package:foodtek_project/view/screens/profile_screen.dart';
import 'package:foodtek_project/view/screens/sandwich_screen.dart';
import 'package:foodtek_project/view/widgets/custom_tabs_widget.dart';
import 'package:foodtek_project/view/widgets/navbarItem_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  late TabController _tabController;

  final List<Widget> _bottomNavPages = [
    HomeScreen(),
    FavoritesScreen(),
    CartScreen(),
    HistoryScreen(),
    ProfileScreen(),
  ];

  final List<Widget> _tabPages = [
    HomeScreen(),
    BurgerScreen(),
    SandwichScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabPages.length, vsync: this);
  }

  void _onNavBarTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isCartScreen = selectedIndex == 2; //  check if user in CartScreen

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: selectedIndex == 0
            ? Column(
                children: [
                  CustomTabs(tabController: _tabController),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: _tabPages,
                    ),
                  ),
                ],
              )
            : _bottomNavPages[selectedIndex],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        color: const Color(0xFFDCF4D1),
        child: Container(
          height: 20,
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: NavBarItem(
                  icon: Icons.home_outlined,
                  label: "Home",
                  index: 0,
                  selectedIndex: selectedIndex,
                  onTap: _onNavBarTapped,
                ),
              ),
              Flexible(
                child: NavBarItem(
                  icon: Icons.favorite_border,
                  label: "Favorites",
                  index: 1,
                  selectedIndex: selectedIndex,
                  onTap: _onNavBarTapped,
                ),
              ),
              SizedBox(width: 48),
              Flexible(
                child: NavBarItem(
                  icon: isCartScreen ? Icons.track_changes_outlined : Icons.history,
                  label: isCartScreen ? "Track" : "History",
                  index: 3,
                  selectedIndex: selectedIndex,
                  onTap: _onNavBarTapped,
                ),
              ),
              Flexible(
                child: NavBarItem(
                  icon: Icons.person_outline,
                  label: "Profile",
                  index: 4,
                  selectedIndex: selectedIndex,
                  onTap: _onNavBarTapped,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          _onNavBarTapped(2); 
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(Icons.shopping_cart_outlined, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
