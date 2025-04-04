import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/notification_icon_widget.dart';

class OrderDoneScreen extends StatefulWidget {
  final int estimatedDeliveryTime;

  const OrderDoneScreen({Key? key, required this.estimatedDeliveryTime})
      : super(key: key);

  @override
  State<OrderDoneScreen> createState() => _OrderDoneScreenState();
}

class _OrderDoneScreenState extends State<OrderDoneScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.8, end: 1.2).animate(_controller);
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 8.h),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(top: 30.h, right: 5.w),
                child: NotificationIconWidget(),
              ),
            ),
            SizedBox(height: 8,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Checkout',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            SizedBox(height: 45.h),


            Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: 1.sw,
                        maxHeight: 300.h,
                      ),
                      child: Image.asset(
                        'assets/images/congrate_photo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Positioned(
                      bottom: 44.h,
                      child: AnimatedBuilder(
                        animation: _animation,
                        builder: (context, child) {
                          return Transform.scale(
                            scale: _animation.value,
                            child: Container(
                              width: 55.w,
                              height: 58.h,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 23.sp,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),


            SizedBox(height: 25.h),

            Center(
              child: Text(
                'Your order done successfully',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            SizedBox(height: 10.h),

            Center(
              child: Text(
                'You will get your order within ${widget.estimatedDeliveryTime}min.\n Thanks for using our services',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            SizedBox(height: 35.h),

            Center(
              child: SizedBox(
                width: 318.w,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  TrackOrderScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 18.h),
                    backgroundColor: Color(0xFF25AE4B),
                    elevation: 10,
                    shadowColor:  Color(0xFF25AE4B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  child: Text(
                    'track your order',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 14.h),
          ],
        ),
      ),
    );
  }
}

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Track Your Order')),
      body: const Center(child: Text('Order tracking screen content')),
    );
  }
}