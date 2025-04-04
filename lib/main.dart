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


    final dummyProduct = Product(
        id: '1',
        name: 'Pepperoni Pizza',
        description: 'Delicious pizza with pepperoni and cheese',
        cartDescription: '',
        price: 12.99,
        oldPrice: 15.99,
        imageUrl: 'https://media.istockphoto.com/id/1414575281/photo/a-delicious-and-tasty-italian-pizza-margherita-with-tomatoes-and-buffalo-mozzarella.jpg',
        rating: 4.5,
        reviews: 120,
        detailedDescription: 'jnasjhbdcuwacbfkHBCKLAUHKAN DJHCAND AHDJWDNA NSCAASJJ '
    );

    List<Product> dummyCartItems = [
      Product(
          id: '1',
          name: 'chicken Burger',
          cartDescription: 'burger factory LTD',
          price: 5,
          imageUrl: 'https://media.istockphoto.com/id/2148672887/photo/beef-patty-burger-with-vegetables-and-lettuce-on-white-background-file-contains-clipping-path.jpg?s=2048x2048&w=is&k=20&c=I0IuONNkgrR2bWa7VazV04DsbqpgCEaHd26N3i7zjeg=',
          quantity: 1,
          description: '',
          detailedDescription: ''

      ),
      Product(
          id: '2',
          name: 'onion pizza',
          cartDescription: 'pizza place',
          price: 4,
          imageUrl: 'https://media.istockphoto.com/id/2037186126/photo/pizza-with-arugula-and-tuna-with-red-onions.jpg?s=2048x2048&w=is&k=20&c=XL5y5ZXzdCRQolwmwBCHIh396UCQrdPEBF8Jw7i7aJM=',
          quantity: 1,
          description: '',
          detailedDescription: ''
      ),
      Product(
          id: '3',
          name: 'shawarma meal',
          cartDescription: 'meal shawarma spot',
          price: 2.5,
          imageUrl: 'https://media.istockphoto.com/id/959937952/photo/greek-gyros-wraped-in-a-pita-bread-on-a-wooden-background.jpg?s=2048x2048&w=is&k=20&c=1PbhvMRUCOoj_FY-OqZw1r2vXPOwEci3rKYyKzuLg2A=',
          quantity: 1,
          description: '',
          detailedDescription: ''
      ),
      Product(
          id: '4',
          name: 'spicy shawarma',
          cartDescription: 'hot cool spot',
          price: 3.5,
          imageUrl: 'https://media.istockphoto.com/id/2169962528/photo/doner-kebab-or-shawarma-sandwich-isolated-on-white-background.jpg?s=2048x2048&w=is&k=20&c=46Nxe_RbOjKmTjoPRLSRG0e6QgJFDX4aMOafzHiwkXk=',
          quantity: 1,
          description: '',
          detailedDescription: ''
      ),

    ];

// CartScreen( cartItems: dummyCartItems, ),


    //  TrackingScreen(
    // driverProfile: UserProfile(
    //   userId: "driver_123",
    // name: "Aleksander V.",
    //  address: "Amman-Jordan",
    //  location: LatLng(31.98184077748213, 35.86489741215683),
    //  profileImageUrl: "https://media.istockphoto.com/id/1476170969/photo/portrait-of-young-man-ready-for-job-business-concept.jpg?s=2048x2048&w=is&k=20&c=yif473DFhN451o-tNC1tASFFoP5QTOYcqS26dhEbv6U=",
    // ),
    //  userProfile: UserProfile(
    //  userId: "user_456",
    //  name: "seba ramzi",
    //  address: "Al-Madina Al-Monawara St",
    //  location: LatLng(31.981294753640345, 35.86544458280203),
    //   profileImageUrl: "https://media.istockphoto.com/id/1476170969/photo/portrait-of-young-man-ready-for-job-business-concept.jpg?s=2048x2048&w=is&k=20&c=yif473DFhN451o-tNC1tASFFoP5QTOYcqS26dhEbv6U=",

  }}
