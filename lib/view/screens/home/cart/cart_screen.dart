import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek_project/data/cart_item_list.dart';
import 'package:foodtek_project/model/product_model.dart';
import 'package:foodtek_project/view/widgets/cart/cart_item_widget.dart';
import 'package:foodtek_project/view/widgets/cart/empty_cart_widget.dart';
import 'package:foodtek_project/view/widgets/home/notification_icon_widget.dart';

import 'package:foodtek_project/view/widgets/main_page/location_search_widget.dart';
import 'package:foodtek_project/view/widgets/price_details_widget.dart';
import '../../../widgets/location_widget.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // void increaseQuantity(int index) {
  //   setState(() {
  //     widget.cartItems[index].quantity++;
  //   });
  // }

  // void decreaseQuantity(int index) {
  //   setState(() {
  //     if (widget.cartItems[index].quantity > 1) {
  //       widget.cartItems[index].quantity--;
  //     }
  //   });
  // }

  // void removeItem(int index) {
  //   setState(() {
  //     widget.cartItems.removeAt(index);
  //   });
  // }

  // double get subtotal {
  //   return widget.cartItems.fold(
  //     0,
  //     (sum, item) => sum + (item.price * item.quantity),
  //   );
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child:
                cartItems.isEmpty
                    ? EmptyCartWidget()
                    : ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        return CartItemWidget(
                          product: cartItems[index],
                          onIncrease: () {}, //=> increaseQuantity(index),
                          onDecrease: () {}, //=> decreaseQuantity(index),
                          onRemove: () {}, // => removeItem(index),
                        );
                      },
                    ),
          ),
          if (cartItems.isNotEmpty)
            PriceDetailsWidget(subtotal: 100, onPlaceOrder: () {}),
        ],
      ),
    );
  }
}
