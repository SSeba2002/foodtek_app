import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek_project/model/product_model.dart';
import 'package:foodtek_project/view/widgets/home/notification_icon_widget.dart';
import 'package:foodtek_project/view/widgets/search_bar_widget.dart';
import 'package:foodtek_project/view/widgets/product_card.dart';

import '../widgets/location_widget.dart';

import 'home/home/Product_Detail_screen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  List<Product> products = [
    Product(
      id: '1',
      name: 'Pepperoni Pizza',
      description:
          'Pepperoni pizza, Margarita Pizza Margherita Italian cuisine Tomato',
      cartDescription: '',
      price: 29,
      imageUrl:
          'https://media.istockphoto.com/id/1460915397/photo/food-photos-various-entrees-appetizers-deserts-etc.jpg?s=1024x1024&w=is&k=20&c=-78F8r26L_INzYltHXcqqrEqG4z6MIlKb0awxJDUU04=',
      detailedDescription: '',
    ),
    Product(
      id: '2',
      name: 'Peppy Paneer',
      description: 'Chunky paneer with crisp capsicum and spicy red pepper',
      cartDescription: '',
      price: 13,
      imageUrl:
          'https://media.istockphoto.com/id/663909704/photo/pizza-with-mushrooms-and-fresh-basil.jpg?s=1024x1024&w=is&k=20&c=pPSWV5y4AXKYGT0Vn9ZvxC4sT04BMrhLPg8Asp10Szw=',
      detailedDescription: '',
    ),
    Product(
      id: '3',
      name: 'Mexican Green Wave',
      description:
          'A pizza loaded with crunchy onions, crisp capsicum, juicy tomatoes',
      cartDescription: '',
      price: 23,
      imageUrl:
          'https://media.istockphoto.com/id/2158544491/photo/sous-vide-chicken-pizza-on-melted-cheese-base-with-corn-and-arugula.jpg?s=1024x1024&w=is&k=20&c=WnIQJm-eXgtWCpSuP4-piaI2c_yUXKAfh0prYGs4OIs=',
      detailedDescription: '',
    ),
    Product(
      id: '4',
      name: 'Pizza Cheese',
      description:
          'Food pizza dish junk food , fast food , flatbread , ingredient',
      cartDescription: '',
      price: 23,
      imageUrl:
          'https://media.istockphoto.com/id/1414575281/photo/a-delicious-and-tasty-italian-pizza-margherita-with-tomatoes-and-buffalo-mozzarella.jpg?s=1024x1024&w=is&k=20&c=bwoUzONnFgIK65TQ7uUeSAlM78h-gCmKSR3nnGhb6AI=',
      detailedDescription: '',
    ),
  ];

  void _toggleFavorite(int index) {
    setState(() {
      products[index] = products[index].copyWith(
        isFavorite: !products[index].isFavorite,
      );
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          products[index].isFavorite
              ? '❤️ Added to Favorites '
              : '💔 Removed from Favorites',
          textAlign: TextAlign.center,
        ),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.4,
          left: 20.w,
          right: 20.w,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        backgroundColor: Colors.grey[800],
      ),
    );
  }

  void navigateToProductDetail(Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => ProductDetailScreen(
              product: product.copyWith(
                rating: product.rating ?? 4.5,
                reviews: product.reviews ?? 120,
              ),
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(360, 690));

    return Scaffold(
      appBar: AppBar(toolbarHeight: 25.h),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [LocationWidget(), NotificationIconWidget()],
            ),
          ),
          SizedBox(height: 2),
          SearchBarWidget(onFilterPressed: () {}),
          SizedBox(height: 15.h),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20.w,
                mainAxisSpacing: 25.h,
                childAspectRatio: 0.75,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  product: products[index],
                  onFavoritePressed: () => _toggleFavorite(index),
                  onOrderPressed:
                      () => navigateToProductDetail(products[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
