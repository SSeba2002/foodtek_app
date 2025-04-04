import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek_project/model/product_model.dart';
import 'package:foodtek_project/view/widgets/cart_item_widget.dart';
import 'package:foodtek_project/view/widgets/empty_cart_widget.dart';
import 'package:foodtek_project/view/widgets/price_details_widget.dart';
import '../widgets/location_widget.dart';
import '../widgets/notification_icon_widget.dart';

class CartScreen extends StatefulWidget {
  final List<Product> cartItems;
  const CartScreen({super.key, required this.cartItems});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void increaseQuantity(int index) {
    setState(() {
      widget.cartItems[index].quantity++;
    });
  }

  void decreaseQuantity(int index) {
    setState(() {
      if (widget.cartItems[index].quantity > 1) {
        widget.cartItems[index].quantity--;
      }
    });
  }

  void removeItem(int index) {
    setState(() {
      widget.cartItems.removeAt(index);
    });
  }

  double get subtotal {
    return widget.cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 25.h),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LocationWidget(),
                NotificationIconWidget(),
              ],
            ),
          ),
          Expanded(
            child: widget.cartItems.isEmpty
                ? EmptyCartWidget()
                : ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                return CartItemWidget(
                  product: widget.cartItems[index],
                  onIncrease: () => increaseQuantity(index),
                  onDecrease: () => decreaseQuantity(index),
                  onRemove: () => removeItem(index),
                );
              },
            ),
          ),
          if (widget.cartItems.isNotEmpty)
            PriceDetailsWidget(
              subtotal: subtotal,
              onPlaceOrder: () {},
            ),
        ],
      ),
    );
  }
}