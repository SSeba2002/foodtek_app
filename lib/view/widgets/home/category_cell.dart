import 'package:flutter/material.dart';

class CategoryCell extends StatelessWidget {
  final String cObj;
  final String image;
  final String? price; // Price for recommended items
  final double? rating; // Rating for big cards
  final bool isRecommended; // To switch designs
  final String description;
  final VoidCallback onTap;
  final VoidCallback onAddTap;

  const CategoryCell({
    super.key,
    required this.cObj,
    required this.onTap,
    required this.onAddTap,
    required this.image,
    this.price,
    this.rating,
    this.isRecommended = false,
    required this.description, // Default to false (big card design)
  });

  @override
  Widget build(BuildContext context) {
    return isRecommended
        ? _buildRecommendedItem()
        : buildMainCategoryItem(context);
  }

  // UI for "Recommended" small rounded items
  Widget _buildRecommendedItem() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    image,
                    width: 100,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      price ?? '0.00',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMainCategoryItem(BuildContext context) {
    return Container(
      width: 160,
      height: 200,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            /// Stack for image and rating
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),

              // decoration: BoxDecoration(
              //   color: Colors.orange,
              //   borderRadius: BorderRadius.circular(10),
              // ),
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.yellowAccent, size: 14),
                  SizedBox(width: 3),
                  Text(
                    rating?.toString() ?? '0.0',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Image.asset(
              image,
              width: double.infinity,
              height: 70,
              fit: BoxFit.fitHeight,
            ),
            SizedBox(height: 10),

            /// Text Section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cObj,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 6),
                  Expanded(
                    child: Text(
                      description,
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),

            /// Price and Add Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price ?? '0.00',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: onAddTap,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.add, color: Colors.white, size: 20),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
