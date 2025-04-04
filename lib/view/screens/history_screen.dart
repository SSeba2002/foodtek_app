import 'package:flutter/material.dart';
import 'package:foodtek_project/view/screens/empty_history_screen.dart';
import 'package:foodtek_project/view/widgets/customTabBar_widget.dart';
import 'package:foodtek_project/view/screens/product_detail_screen.dart';
import 'package:foodtek_project/model/product_model.dart';

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
            Center(child: Text("Cart is empty!", style: TextStyle(fontSize: 18))),
            HistoryTab(),
          ],
        ),
      ),
    );
  }
}

class HistoryTab extends StatelessWidget {
  final List<Map<String, String>> orders = [];

  HistoryTab({super.key});

  Product _createMockProduct() {
    return Product(
      id: 'mock_001',
      name: 'Spicy Shawarma',
      description: 'Delicious spicy shawarma with special sauce',
      cartDescription: 'Spicy Shawarma',
      detailedDescription: 'A mouth-watering spicy shawarma with fresh vegetables and our special garlic sauce, wrapped in warm bread.',
      price: 15.0,
      oldPrice: 18.0,
      imageUrl: 'assets/images/spicy_shawarma.png',
      rating: 4.7,
      reviews: 85,
      quantity: 1,
      isFavorite: false,
    );
  }

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
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailScreen(
                                    product: _createMockProduct(),
                                  ),
                                ),
                              );
                            },
                            child: Text("Reorder",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold)),
                          ),
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