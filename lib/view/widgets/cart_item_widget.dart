import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek_project/model/product_model.dart';

class CartItemWidget extends StatelessWidget {
  final Product product;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onRemove;

  const CartItemWidget({
    super.key,
    required this.product,
    required this.onIncrease,
    required this.onDecrease,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Dismissible(
        key: Key(product.id),
        direction: DismissDirection.endToStart,
        background: Container(
          margin: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(8.r),
          ),
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 20.w),
          child: Icon(
            Icons.delete_outline,
            color: Colors.white,
            size: 40.w,
          ),
        ),
        onDismissed: (direction) => onRemove(),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 4.h),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFFDBF4D1),
              width: 1.w,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 8.h,
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: Container(
                    width: 55.w,
                    height: 55.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      image: DecorationImage(
                        image: NetworkImage(product.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        product.cartDescription,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w200,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        '${product.price.toStringAsFixed(2)}JD',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.green,
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(width: 6.w),
                Row(
                  children: [
                    InkWell(
                      onTap: onDecrease,
                      child: Container(
                        width: 27.w,
                        height: 26.h,
                        decoration: BoxDecoration(
                          color: product.quantity == 1
                              ? Color(0xFFE8F5E9)
                              : Colors.green,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.remove,
                            size: 14.w,
                            color: product.quantity == 1
                                ? Colors.green
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      '${product.quantity}',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    InkWell(
                      onTap: onIncrease,
                      child: Container(
                        width: 27.w,
                        height: 26.h,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            size: 14.w,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}