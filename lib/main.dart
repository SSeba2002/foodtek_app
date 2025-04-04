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
