import 'package:flutter/material.dart';
import 'package:foodtek_project/const/gradient_button_widget.dart';
import 'package:foodtek_project/const/responsive.dart';
import 'package:foodtek_project/view/screens/location_permission_screen.dart';

class ChooseFoodScreen extends StatelessWidget {
  const ChooseFoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: responsiveHeight(context, 300),
              child: Image.asset(
                "assets/images/Pattern.png",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/food_delivery.png",
                    height: responsiveHeight(context, 219),
                    width: responsiveWidth(context, 328.5),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Choose Your Food",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Order Your Favorite Food Within The\n"
                    "Palm Of Your Hand And The Zone\n"
                    "Of Your Comfort",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 30),
                  GradientButton(
                    text: "Continue",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => LocationPermissionScreen()),
                      );
                    },
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    LocationPermissionScreen()), // NextScreen 
                          );
                        },
                        child: const Text(
                          "Skip",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                      Row(
                        children: List.generate(3, (index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: index == 2 ? Colors.green : Colors.grey,
                            ),
                          );
                        }),
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward,
                            color: Colors.green),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const LocationPermissionScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
