import 'package:flutter/material.dart';
import 'package:foodtek_project/view/widgets/foodcard_widget.dart';
import 'package:foodtek_project/view/widgets/home/notification_icon_widget.dart';
import '../../../widgets/location_widget.dart';

import '../../../widgets/search_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      "assets/images/dessert1.png",
      "assets/images/dessert2.png",
      "assets/images/dessert3.png",
      "assets/images/dessert4.png",
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [LocationWidget(), NotificationIconWidget()],
            ),
            const SizedBox(height: 5),

            // Search Bar
            SearchBarWidget(onFilterPressed: () {}),
            const SizedBox(height: 20),

            // Discount Banner
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                "assets/images/discount.png",
                width: double.infinity,
                height: 160,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            // Top Rated Section
            const Text(
              "Top Rated",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 230,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  FoodCard(
                    imageUrl: "assets/images/chicken_burger.png",
                    title: "Chicken Burger",
                    description: "100g chicken + tomato + cheese + Lettuce",
                    price: "\$20.00",
                    rating: 3.8,
                    alignAddButtonRight: true,
                  ),
                  SizedBox(width: 10),
                  FoodCard(
                    imageUrl: "assets/images/chese_burger.png",
                    title: "Chese Burger",
                    description: "100g meat + onion + tomato + Lettuce",
                    price: "\$15.00",
                    rating: 4.5,
                    alignAddButtonRight: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Recommend Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Recommend",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "View All",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Recommended Images
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children:
                    images.map((image) {
                      return Container(
                        width: 120,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            image,
                            height: 150,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
