import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek_project/l10n/generated/app_localizations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderDetailsScreen extends StatelessWidget {
  final int currentStep = 2;
  final LatLng? selectedLocation;
  final String? userAddress;

  final List<Map<String, dynamic>> steps = [
    {"title": "orderReceived", "icon": Icons.check_circle, "completed": true},
    {"title": "cookingOrder", "icon": Icons.restaurant, "completed": true},
    {"title": "courierPicking", "icon": Icons.person, "completed": true},
    {"title": "orderDelivered", "icon": Icons.home, "completed": false},
  ];

  OrderDetailsScreen({
    super.key,
    this.selectedLocation,
    this.userAddress,
  });

  String _getTranslatedStepTitle(BuildContext context, String titleKey) {
    switch (titleKey) {
      case "orderReceived":
        return AppLocalizations.of(context)!.orderReceived;
      case "cookingOrder":
        return AppLocalizations.of(context)!.cookingOrder;
      case "courierPicking":
        return AppLocalizations.of(context)!.courierPicking;
      case "orderDelivered":
        return AppLocalizations.of(context)!.orderDelivered;
      default:
        return titleKey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 24.sp),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          AppLocalizations.of(context)!.orderDetails,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 56.h,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Order ID Section
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    color: Colors.orange[100],
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Image.asset(
                    "assets/images/order_id.png",
                    width: 30.w,
                    height: 30.h,
                  ),
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.orderId,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      AppLocalizations.of(context)!.orderNumber,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      AppLocalizations.of(context)!.deliveryTime,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30.h),

            /// Order Status
            Column(
              children: List.generate(steps.length, (index) {
                bool isCompleted = steps[index]["completed"];
                return Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          steps[index]['icon'],
                          color: isCompleted
                              ? Color(0xFF25AE4B)
                              : Colors.grey[400],
                          size: 28.sp,
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          _getTranslatedStepTitle(context, steps[index]['title']),
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    if (index != steps.length - 1)
                      Padding(
                        padding: EdgeInsets.only(
                          left: 13.w,
                          top: 4.h,
                          bottom: 4.h,
                        ),
                        child: Container(
                          width: 2.w,
                          height: 24.h,
                          color: Colors.grey[300],
                        ),
                      ),
                  ],
                );
              }),
            ),
            SizedBox(height: 30.h),

            /// Delivery Hero Section
            Text(
              AppLocalizations.of(context)!.yourDeliveryHero,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                CircleAvatar(
                  radius: 25.r,
                  backgroundImage: AssetImage('assets/images/delivery_person.jpg'),
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.deliveryPersonName,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Icon(Icons.star, size: 16.sp, color: Colors.orange),
                        SizedBox(width: 4.w),
                        Text(
                          AppLocalizations.of(context)!.deliveryPersonRating,
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                IconButton(
                  icon: Icon(
                    Icons.phone,
                    color: Color(0xFF25AE4B),
                    size: 24.sp,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.message,
                    color: Colors.orange,
                    size: 24.sp,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 30.h),

            /// Delivery Address
            Text(
              AppLocalizations.of(context)!.yourLocation,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.green,
                  size: 24.sp,
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    userAddress ?? AppLocalizations.of(context)!.deliveryAddress,
                    style: TextStyle(fontSize: 15.sp),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50.h),

            /// Live Track Button
            Center(
              child: SizedBox(
                width: 295.w,
                height: 48.h,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF25AE4B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 14.h,
                      horizontal: 60.w,
                    ),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.liveTrack,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}