import 'package:flutter/material.dart';
import 'package:foodtek_project/constant/responsive.dart';

class OrderDetailsScreen extends StatelessWidget {
  final int currentStep = 2; //current state of order

  final List<Map<String, dynamic>> steps = [
    {"title": "Order received", "icon": Icons.check_circle, "completed": true},
    {
      "title": "Cooking your order",
      "icon": Icons.restaurant,
      "completed": true,
    },
    {
      "title": "Courier is picking up order",
      "icon": Icons.person,
      "completed": true,
    },
    {"title": "Order delivered", "icon": Icons.home, "completed": false},
  ];

  OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Order Details", style: TextStyle(color: Colors.black)),
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
                      "Order ID",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "#9579-6432",
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                    Text(
                      "25m",
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
                          color:
                              isCompleted
                                  ? Color.fromRGBO(37, 174, 75, 1)
                                  : Colors.grey[400], // لون الأيقونة فقط يتغير
                          size: 28,
                        ),
                        SizedBox(width: 12),
                        Text(
                          steps[index]['title'],
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
              "Your Delivery Hero",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(
                    'assets/images/delivery_person.jpg',
                  ), // صورة المندوب
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Aleksandr V.",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, size: 16, color: Colors.orange),
                        SizedBox(width: 4),
                        Text("4.9", style: TextStyle(fontSize: 14)),
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
              "Your location",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.green),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "123 Al-Madina Street, Abdali, Amman, Jordan",
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
                  "Live Track",
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
