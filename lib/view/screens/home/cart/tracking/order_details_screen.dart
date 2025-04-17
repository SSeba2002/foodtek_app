import 'package:flutter/material.dart';
import 'package:foodtek_project/constant/responsive.dart';
import 'package:foodtek_project/l10n/generated/app_localizations.dart';

class OrderDetailsScreen extends StatelessWidget {
  final int currentStep = 2;

  final List<Map<String, dynamic>> steps = [
    {"title": "orderReceived", "icon": Icons.check_circle, "completed": true},
    {"title": "cookingOrder", "icon": Icons.restaurant, "completed": true},
    {"title": "courierPicking", "icon": Icons.person, "completed": true},
    {"title": "orderDelivered", "icon": Icons.home, "completed": false},
  ];

  OrderDetailsScreen({super.key});

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
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          AppLocalizations.of(context)!.orderDetails,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Order ID Section
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.orange[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    "assets/images/order_id.png",
                    width: 30,
                    height: 30,
                  ),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.orderId,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.orderNumber,
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                    Text(
                      AppLocalizations.of(context)!.deliveryTime,
                      style: TextStyle(fontSize: 14, color: Colors.green),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),

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
                              ? Color.fromRGBO(37, 174, 75, 1)
                              : Colors.grey[400],
                          size: 28,
                        ),
                        SizedBox(width: 12),
                        Text(
                          _getTranslatedStepTitle(context, steps[index]['title']),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    if (index != steps.length - 1)
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 13,
                          top: 4,
                          bottom: 4,
                        ),
                        child: Container(
                          width: 2,
                          height: 24,
                          color: Colors.grey[300],
                        ),
                      ),
                  ],
                );
              }),
            ),
            SizedBox(height: 30),
            Text(
              AppLocalizations.of(context)!.yourDeliveryHero,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/images/delivery_person.jpg'),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.deliveryPersonName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, size: 16, color: Colors.orange),
                        SizedBox(width: 4),
                        Text(
                          AppLocalizations.of(context)!.deliveryPersonRating,
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                IconButton(
                  icon: Icon(
                    Icons.phone,
                    color: Color.fromRGBO(37, 174, 75, 1),
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.message, color: Colors.orange),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 30),

            /// Delivery Address
            Text(
              AppLocalizations.of(context)!.yourLocation,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.green),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    AppLocalizations.of(context)!.deliveryAddress,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),

            SizedBox(
              width: responsiveWidth(context, 295),
              height: responsiveHeight(context, 48),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(37, 174, 75, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 60),
                ),
                child: Text(
                  AppLocalizations.of(context)!.liveTrack,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}