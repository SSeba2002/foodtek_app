import 'package:flutter/material.dart';
import 'package:foodtek_project/view/screens/home/home/burger_screen.dart';
import 'package:foodtek_project/view/screens/home/cart/cart_screen.dart';
import 'package:foodtek_project/view/screens/home/favorites/favorite_screen.dart';
import 'package:foodtek_project/view/screens/home/history/history_screen.dart';
import 'package:foodtek_project/view/screens/home/home/home_screen.dart';
import 'package:foodtek_project/view/screens/home/profile/profile_screen.dart';
import 'package:foodtek_project/view/screens/home/home/sandwich_screen.dart';
import 'package:foodtek_project/view/widgets/custom_tabs_widget.dart';
import 'package:foodtek_project/view/widgets/navbarItem_widget.dart';
import 'package:foodtek_project/view/screens/explore_screen.dart';
import 'package:foodtek_project/model/product_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  late TabController _tabController;

  List<Product> cartItems = [];

  final List<Widget> _bottomNavPages = [];
  final List<Widget> _tabPages = [];

  @override
  void initState() {
    super.initState();

    // Initialize cartItems in the initState method
    cartItems = [
      Product(
        id: '1',
        name: 'Burger Deluxe',
        description: 'A delicious burger with all the toppings!',
        cartDescription: 'Delicious burger with extra cheese and sauce',
        detailedDescription:
            'A premium burger with a juicy patty, fresh lettuce, and tomato.',
        price: 5.99,
        oldPrice: 7.99,
        imageUrl:
            'https://media.istockphoto.com/id/2148672887/photo/beef-patty-burger-with-vegetables-and-lettuce-on-white-background-file-contains-clipping-path.jpg?s=2048x2048&w=is&k=20&c=I0IuONNkgrR2bWa7VazV04DsbqpgCEaHd26N3i7zjeg=',
        rating: 4.8,
        reviews: 150,
        quantity: 1,
        isFavorite: true,
      ),
      Product(
        id: '2',
        name: 'Pizza Margherita',
        description: 'Classic pizza with fresh mozzarella and basil.',
        cartDescription: 'Cheese pizza with a delicious tomato sauce',
        detailedDescription:
            'A simple yet delicious pizza with fresh mozzarella and basil.',
        price: 8.99,
        oldPrice: 10.99,
        imageUrl:
            'https://media.istockphoto.com/id/1278998606/photo/fresh-homemade-pizza-margherita.jpg?s=2048x2048&w=is&k=20&c=RyAYAzGBzuCq1pjPNnr9LvC7eQI-RYOXNVzi3doXfXk=',
        rating: 4.5,
        reviews: 200,
        quantity: 2,
        isFavorite: false,
      ),
    ];

    _tabController = TabController(length: _tabPages.length, vsync: this);

    _bottomNavPages.addAll([
      HomeScreen(),
      FavoritesScreen(),
      CartScreen(cartItems: cartItems),
      HistoryScreen(),
      ProfileScreen(),
    ]);

    _tabPages.addAll([
      HomeScreen(),
      BurgerScreen(),
      ExploreScreen(),
      SandwichScreen(),
    ]);
  }

  void _onNavBarTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isCartScreen = selectedIndex == 2;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child:
            selectedIndex == 0
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
                  icon:
                      isCartScreen
                          ? Icons.track_changes_outlined
                          : Icons.history,
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Icon(Icons.shopping_cart_outlined, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}