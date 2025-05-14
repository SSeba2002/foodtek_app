import 'package:flutter/material.dart';
import 'package:foodtek_project/constant/responsive.dart';
import 'package:foodtek_project/view/screens/home/home/Product_Detail_screen.dart';
import 'package:foodtek_project/model/product_model.dart';

class FoodCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String price;
  final double rating;
  final bool alignAddButtonRight;

  const FoodCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.alignAddButtonRight,
  });

  @override
  Widget build(BuildContext context) {
    Product product = Product(
      id: '1',
      name: 'Burger Deluxe',
      description: 'A delicious burger with all the toppings!',
      cartDescription: 'Delicious burger with extra cheese and sauce',
      detailedDescription:
          'A premium burger with a juicy patty, fresh lettuce, and tomato.',
      price: 5,
      oldPrice: 7.99,
      imageUrl:
          'https://media.istockphoto.com/id/2148672887/photo/beef-patty-burger-with-vegetables-and-lettuce-on-white-background-file-contains-clipping-path.jpg?s=2048x2048&w=is&k=20&c=I0IuONNkgrR2bWa7VazV04DsbqpgCEaHd26N3i7zjeg=',
      rating: 4.8,
      reviews: 150,
      quantity: 1,
      isFavorite: true,
    );
    return Container(
      width: responsiveWidth(context, 155),
      height: responsiveHeight(context, 209),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                imageUrl,
                width: responsiveWidth(context, 131),
                height: responsiveHeight(context, 76),
              ),
              Positioned(
                top: 5,
                left: 5,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 3,
                  ),

                  child: Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        rating.toString(),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                price,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, right: 10),
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => ProductDetailScreen(product: product),
                      ),
                    );
                  },
                  backgroundColor: Colors.green,
                  shape: CircleBorder(),
                  mini: true,
                  child: const Icon(Icons.add, size: 24, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
