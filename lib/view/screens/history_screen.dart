import 'package:flutter/material.dart';
import 'package:foodtek_project/view/screens/empty_history_screen.dart';
import 'package:foodtek_project/view/widgets/customTabBar_widget.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight + 50),
          child: CustomTabBar(),
        ),
        body: TabBarView(
          children: [
            Center(
                child: Text("Cart is empty!", style: TextStyle(fontSize: 18))),
            HistoryTab(),
          ],
        ),
      ),
    );
  }
}

class HistoryTab extends StatelessWidget {
  // if list is empty it will display EmptyHistoryScreen
  final List<Map<String, String>> orders = [];

   HistoryTab({super.key});
  
  // if list have orders it will show it 

/*
  final List<Map<String, String>> orders = [
    {
      "image": "assets/images/chicken_burger1.png",
      "name": "Chicken Burger",
      "restaurant": "Burger Factory LTD",
      "price": "\$20",
      "date": "25.3.2024",
    },
    {
      "image": "assets/images/onion_pizza.png",
      "name": "Onion Pizza",
      "restaurant": "Pizza Palace",
      "price": "\$15",
      "date": "25.3.2024",
    },
    {
      "image": "assets/images/spicy_shawarma.png",
      "name": "Spicy Shawarma",
      "restaurant": "Hot Cool Spot",
      "price": "\$15",
      "date": "25.3.2024",
    },
  ];*/
  @override
  Widget build(BuildContext context) {
    return orders.isEmpty
        ? EmptyHistoryScreen()
        : Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    final order = orders[index];
                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        leading:
                            Image.asset(order["image"]!, width: 50, height: 50),
                        title: Text(order["name"]!,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(order["restaurant"]!),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(order["date"]!,
                                style: TextStyle(color: Colors.grey)),
                            SizedBox(height: 5),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.replay,
                                    color: Colors.green, size: 16),
                                SizedBox(width: 5),
                                Text("Reorder",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("Load More..",
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold)),
              ),
            ],
          );
  }
}
