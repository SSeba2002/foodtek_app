import 'package:flutter/material.dart';
import 'package:foodtek_project/const/gradient_button_widget.dart';
import 'package:foodtek_project/const/responsive.dart';
import 'package:foodtek_project/view/screens/login_screen.dart';

class LocationPermissionScreen extends StatefulWidget {
  const LocationPermissionScreen({super.key});

  @override
  State<LocationPermissionScreen> createState() =>
      _LocationPermissionScreenState();
}

class _LocationPermissionScreenState extends State<LocationPermissionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            width: double.infinity,
            height: responsiveHeight(context, 300),
            child: Image.asset(
              "assets/images/location.png",
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
                  "Turn On Your Location",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "To Continues, Let Your Device Turn \n"
                    "On Location, Which Uses Google's \n"
                    "Location Service",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 30),
                GradientButton(
                  text: "Yes, Turn It On",
                  onPressed: () {
                    Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    LoginScreen()), 
                          );
                  },
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: responsiveWidth(context, 307),
                  height: responsiveHeight(context, 48),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    LoginScreen()), 
                          ); // close this screen and return to the previous screen
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(194, 194, 194, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(69),
                      ),
                      elevation: 4.0,
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        //  fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
