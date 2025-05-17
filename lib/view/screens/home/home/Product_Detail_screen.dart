import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek_project/l10n/generated/app_localizations.dart';
import 'package:foodtek_project/model/product_model.dart';
import 'package:foodtek_project/view/widgets/home/notification_icon_widget.dart';
import '../../../widgets/home/location_widget.dart';

import '../../../widgets/home/search_bar_widget.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;
  double spicyLevel = 0.0;

  void increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  void addToCart() {
    print(
      'Added to Cart: ${widget.product.name}, Quantity: $quantity, Spicy Level: ${spicyLevel == 0.0 ? 'Mild' : 'Hot'}',
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        
        content: Text(
          '${widget.product.name}Added to cart',
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

  Widget _buildRatingStars(double rating) {
    int fullStars = rating.floor();
    double partialStar = rating - fullStars;

    return Row(
      children: List.generate(5, (index) {
        if (index < fullStars) {
          return Icon(Icons.star, color: Colors.amber, size: 20.w);
        } else if (index == fullStars && partialStar > 0) {
          return ShaderMask(
            shaderCallback:
                (Rect bounds) => LinearGradient(
                  colors: [Colors.amber, Colors.grey],
                  stops: [0.5, 0.5],
                ).createShader(bounds),
            child: Icon(Icons.star, color: Colors.amber, size: 20.w),
          );
        } else {
          return Icon(Icons.star, color: Colors.grey, size: 20.w);
        }
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      child: Scaffold(
        appBar: AppBar(toolbarHeight: 25.h),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [LocationWidget(), NotificationIconWidget(userId: '2',)],
              ),
            ),
            SizedBox(height: 5),
            SearchBarWidget(onFilterPressed: () {}),
            SizedBox(height: 12.h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.network(
                          widget.product.imageUrl,
                          width: double.infinity,
                          height: 203.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.product.name,
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            children: [
                              _buildRatingStars(widget.product.rating),
                              SizedBox(width: 8.w),
                              Text(
                                '${widget.product.rating}',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                '(${widget.product.reviews} reviews)',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            children: [
                              Text(
                                '${widget.product.price}JD',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  color: const Color(0xFF009944),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              if (widget.product.oldPrice != null) ...[
                                SizedBox(width: 8.w),
                                Text(
                                  '${widget.product.oldPrice}JD',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ],
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            widget.product.description,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: const Color(0xFF868889),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.spicy,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF838383),
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Row(
                                      children: [
                                        Text(
                                          AppLocalizations.of(context)!.mild,
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.green,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(width: 3.w),

                                        SizedBox(
                                          width: 150.w,
                                          child: Stack(
                                            children: [
                                              SliderTheme(
                                                data: SliderTheme.of(
                                                  context,
                                                ).copyWith(
                                                  thumbShape:
                                                      RoundSliderThumbShape(
                                                        enabledThumbRadius: 5.w,
                                                      ),
                                                  activeTrackColor: Colors.red,
                                                  inactiveTrackColor:
                                                      Colors.grey,
                                                  thumbColor: Colors.red,
                                                  showValueIndicator:
                                                      ShowValueIndicator.never,
                                                ),
                                                child: Slider(
                                                  value: spicyLevel,
                                                  min: 0.0,
                                                  max: 1.0,
                                                  divisions: 1,
                                                  onChanged: (double value) {
                                                    setState(() {
                                                      spicyLevel = value;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          AppLocalizations.of(context)!.hot,
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.red,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 16.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.quantity,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF838383),
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: decreaseQuantity,
                                        child: Container(
                                          width: 32.w,
                                          height: 32.h,
                                          decoration: BoxDecoration(
                                            color:
                                                quantity == 1
                                                    ? Colors.white
                                                    : Colors.green,
                                            border: Border.all(
                                              color: Colors.green,
                                              width: 1.w,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              14.r,
                                            ),
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.remove,
                                              size: 14.w,
                                              color:
                                                  quantity == 1
                                                      ? Colors.green
                                                      : Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 8.w),
                                      Text(
                                        '$quantity',
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(width: 8.w),
                                      InkWell(
                                        onTap: increaseQuantity,
                                        child: Container(
                                          width: 32.w,
                                          height: 32.h,
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            border: Border.all(
                                              color: Colors.green,
                                              width: 1.w,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              14.r,
                                            ),
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.add,
                                              size: 14.w,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 32.h),
                          ElevatedButton(
                            onPressed: addToCart,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              minimumSize: Size(double.infinity, 50.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              elevation: 2,
                              shadowColor: Colors.green,
                            ),
                            child: Text(
                            AppLocalizations.of(context)!.addToCart,
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
