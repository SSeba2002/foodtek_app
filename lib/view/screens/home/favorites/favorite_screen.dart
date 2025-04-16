import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek_project/model/explore_item_model.dart';
import 'package:foodtek_project/view/widgets/main_page/location_search_widget.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<ExploreItem> exploreItems = [
    ExploreItem(
      name: 'Pepperoni Pizza',
      description:
          'Pepperoni pizza, Margarita Pizza Margherita Italian cuisine Tomato',
      price: 29,
      imageUrl:
          'https://media.istockphoto.com/id/1460915397/photo/food-photos-various-entrees-appetizers-deserts-etc.jpg?s=1024x1024&w=is&k=20&c=-78F8r26L_INzYltHXcqqrEqG4z6MIlKb0awxJDUU04=',
    ),
    ExploreItem(
      name: 'Peppy Paneer',
      description: 'Chunky paneer with crisp capsicum and spicy red pepper',
      price: 13,
      imageUrl:
          'https://media.istockphoto.com/id/663909704/photo/pizza-with-mushrooms-and-fresh-basil.jpg?s=1024x1024&w=is&k=20&c=pPSWV5y4AXKYGT0Vn9ZvxC4sT04BMrhLPg8Asp10Szw=',
    ),
    ExploreItem(
      name: 'Mexican Green Wave',
      description:
          'A pizza loaded with crunchy onions, crisp capsicum, juicy tomatoes',
      price: 23,
      imageUrl:
          'https://media.istockphoto.com/id/2158544491/photo/sous-vide-chicken-pizza-on-melted-cheese-base-with-corn-and-arugula.jpg?s=1024x1024&w=is&k=20&c=WnIQJm-eXgtWCpSuP4-piaI2c_yUXKAfh0prYGs4OIs=',
    ),
    ExploreItem(
      name: 'Pizza Cheese',
      description:
          'Food pizza dish junk food , fast food , flatbread , ingredient',
      price: 23,
      imageUrl:
          'https://media.istockphoto.com/id/1414575281/photo/a-delicious-and-tasty-italian-pizza-margherita-with-tomatoes-and-buffalo-mozzarella.jpg?s=1024x1024&w=is&k=20&c=bwoUzONnFgIK65TQ7uUeSAlM78h-gCmKSR3nnGhb6AI=',
    ),
  ];

  List<bool> isFavorite = [true, true, true, true];

  void toggleFavorite(int index) {
    if (isFavorite[index]) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: 24.h,
              horizontal: 20.w,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Are you sure you want to remove it from favorites?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF25AE4B),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        isFavorite[index] = false;
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Yes",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    } else {
      setState(() {
        isFavorite[index] = true;
      });
    }
  }

  void _navigateToProductDetail(ExploreItem product) {
    // TODO: Replace with actual navigation
    debugPrint('Tapped on ${product.name}');
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690));

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header widgets
            LocationNotificationSrearch(showSearchBar: true),
            SizedBox(height: 20.h),
            Text(
              "Favorites",
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 25.h),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20.w,
                  mainAxisSpacing: 25.h,
                  childAspectRatio: 0.75,
                ),
                itemCount: exploreItems.length,
                itemBuilder: (context, index) {
                  if (!isFavorite[index]) return const SizedBox.shrink();
                  return _buildProductCard(exploreItems[index], index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(ExploreItem product, int index) {
    return Container(
      margin: EdgeInsets.all(6.w),
      padding: EdgeInsets.only(bottom: 35.h),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFDBF4D1), width: 1.w),
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -25.h,
            left: 0,
            right: 0,
            child: Center(
              child: CircleAvatar(
                radius: 42.r,
                backgroundColor: Colors.transparent,
                child: CircleAvatar(
                  radius: 38.r,
                  backgroundImage: NetworkImage(product.imageUrl),
                ),
              ),
            ),
          ),
          Positioned(
            top: -8.h,
            right: -8.w,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFDBF4D1),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: isFavorite[index] ? Colors.red : Colors.grey,
                  size: 18.w,
                ),
                onPressed: () => toggleFavorite(index),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.w),
                    child: Text(
                      product.name,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.bolt,
                          color: const Color(0XFFFFAC33),
                          size: 14.w,
                        ),
                        SizedBox(width: 5.w),
                        Expanded(
                          child: Text(
                            product.description,
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.grey,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.w),
                    child: Text(
                      product.formattedPrice,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: -40.h,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () => _navigateToProductDetail(product),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF25AE4B),
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 6.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                child: Text(
                  'Order Now',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
