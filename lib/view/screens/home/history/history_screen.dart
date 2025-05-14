import 'package:flutter/material.dart';
import 'package:foodtek_project/l10n/generated/app_localizations.dart';
import 'package:foodtek_project/view/screens/home/history/empty_history_screen.dart';
import 'package:foodtek_project/view/screens/home/home/Product_Detail_screen.dart';
import 'package:foodtek_project/model/product_model.dart';

class HistoryScreen extends StatelessWidget {
  final List<Map<String, String>> orders = [];
  HistoryScreen({super.key});

  Product _createMockProduct(BuildContext context) {
    return Product(
      id: 'mock_001',
      name: AppLocalizations.of(context)!.spicyShawarma,
      description: AppLocalizations.of(context)!.shawarma_short_description,
      cartDescription: AppLocalizations.of(context)!.spicyShawarma,
      detailedDescription:
        AppLocalizations.of(context)!.shawarma_full_description,
      price: 15,
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
    return Scaffold(
      body:
          orders.isEmpty
              ? EmptyHistoryScreen()
              : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: orders.length,
                      itemBuilder: (context, index) {
                        final order = orders[index];
                        return Card(
                          margin: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            leading: Image.asset(
                              order["image"]!,
                              width: 50,
                              height: 50,
                            ),
                            title: Text(
                              order["name"]!,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(order["restaurant"]!),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  order["date"]!,
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.replay,
                                      color: Colors.green,
                                      size: 16,
                                    ),
                                    SizedBox(width: 5),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) =>
                                                    ProductDetailScreen(
                                                      product:
                                                          _createMockProduct(context),
                                                    ),
                                          ),
                                        );
                                      },
                                      child: Text(
                                      AppLocalizations.of(context)!.reorder,
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
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
                    child: Text(
                      AppLocalizations.of(context)!.loadMore,
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
    );
  }
}
