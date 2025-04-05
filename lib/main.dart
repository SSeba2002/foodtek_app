<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:foodtek_project/view/screens/add_card_screen.dart';
import 'package:foodtek_project/view/screens/main_screen.dart';
import 'package:foodtek_project/view/screens/map_screen.dart';
import 'package:foodtek_project/view/screens/order_details_screen.dart';

void main() {
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home:OrderDetailsScreen(),
    );
  }
}
||||||| 06fab62
=======
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek_project/view/screens/Checkout_Screen.dart';
import 'package:foodtek_project/view/screens/Product_Detail_screen.dart';
import 'package:foodtek_project/view/screens/cart_screen.dart';
import 'package:foodtek_project/view/screens/chat_screen.dart';
import 'package:foodtek_project/view/screens/explore_screen.dart';
import 'package:foodtek_project/view/screens/order_done_Screen.dart';
import 'package:foodtek_project/view/screens/otp_screen.dart';
import 'package:foodtek_project/view/screens/signup_screen.dart';
import 'package:foodtek_project/view/screens/splash_screen.dart';
import 'package:foodtek_project/view/screens/tracking_screen.dart';
import 'package:foodtek_project/view/screens/welcome_screen.dart';
import 'package:foodtek_project/view/screens/welcome_screen2.dart';
import 'package:foodtek_project/view/widgets/congrate_widget.dart';
import 'package:foodtek_project/view/widgets/notifications_widget.dart';
import 'package:foodtek_project/view/screens/filter_screen.dart';
import 'package:foodtek_project/model/product_model.dart';
import 'package:foodtek_project/model/user_profile_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
return ScreenUtilInit(
useInheritedMediaQuery: true,
minTextAdapt: true,
splitScreenMode: true,
builder: (_, child) {
return MaterialApp(
home: ChatScreen(),
);
});

}}