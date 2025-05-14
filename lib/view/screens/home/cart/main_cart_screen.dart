import 'package:flutter/material.dart';
import 'package:foodtek_project/l10n/generated/app_localizations.dart';
import 'package:foodtek_project/view/screens/home/cart/cart_screen.dart';
import 'package:foodtek_project/view/screens/home/history/history_screen.dart';
import 'package:foodtek_project/view/widgets/main_page/location_search_widget.dart';

class MainCartPage extends StatefulWidget {
  const MainCartPage({super.key});

  @override
  State<MainCartPage> createState() => _CartPageState();
}

class _CartPageState extends State<MainCartPage>
    with SingleTickerProviderStateMixin {
  int counter = 1;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // void _toggleCartEmpty() {
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          LocationNotificationSrearch(showSearchBar: false),
          SizedBox(height: 10),
          buildTabBar(),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [CartScreen(cartItems: [],), HistoryScreen()],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTabBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    _tabController.animateTo(0);
                  },
                  child: Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.cart,
                        style: TextStyle(
                          color:
                              _tabController.index == 0
                                  ? Colors.green
                                  : Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: 40,
                        height: 3,
                        color:
                            _tabController.index == 0
                                ? Colors.green
                                : Colors.transparent,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: InkWell(
                  onTap: () {
                    _tabController.animateTo(1);
                  },
                  child: Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.history,
                        style: TextStyle(
                          color:
                              _tabController.index == 1
                                  ? Colors.green
                                  : Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: 40,
                        height: 3,
                        color:
                            _tabController.index == 1
                                ? Colors.green
                                : Colors.transparent,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
