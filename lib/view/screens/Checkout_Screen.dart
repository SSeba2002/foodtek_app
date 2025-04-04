import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/notification_icon_widget.dart';
import '../widgets/price_details_widget.dart';

class CheckoutScreen extends StatefulWidget {
  final double subtotal;

  const CheckoutScreen({super.key, required this.subtotal});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String? userLocation = null;
  String paymentMethod = 'card';
  String cardType = 'visa';
  TextEditingController promoCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 25.h),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: NotificationIconWidget(),
              ),
              SizedBox(height: 8.h),
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
              SizedBox(height: 12.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pay with:',
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 8.h),
                  buildLocationSection(),
                  SizedBox(height: 25.h),
                  buildPromoCodeSection(),
                  SizedBox(height: 21.h),
                  buildPaymentMethodsSection(),
                  SizedBox(height: 10.h),
                  if (paymentMethod == 'card') buildCardTypeSection(),
                  SizedBox(height: 20.h),
                  PriceDetailsWidget(
                    subtotal: widget.subtotal,
                    onPlaceOrder: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLocationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.my_location_outlined, color: Colors.grey, size: 20.sp),
            SizedBox(width: 9.w),
            Text('Al jama‘a Street', style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400)),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 9.w),
          child: Container(
            height: 20.h,
            width: 1.w,
            color: Colors.grey,
          ),
        ),
        Row(
          children: [
            Icon(Icons.location_on_outlined, color: Color(0xFF4CAF50), size: 20.sp),
            SizedBox(width: 9.w),
            Expanded(
              child: userLocation != null
                  ? Text(userLocation!, style: TextStyle(fontSize: 16.sp))
                  : GestureDetector(
                onTap: _goToMapScreen,
                child: Text(
                  ' Add location',
                  style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                ),
              ),
            ),
            if (userLocation != null)
              TextButton(
                onPressed: _goToMapScreen,
                child: Text('Change', style: TextStyle(
                    color: Colors.green,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600
                )),
              ),
          ],
        ),
      ],
    );
  }

  Widget buildPromoCodeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Promo code?',
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600
          ),
        ),
        SizedBox(height: 10.h),
        Container(
          height: 35.h,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 0.6.w,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: promoCodeController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                    hintText: 'Enter promo code',
                    hintStyle: TextStyle(
                        color: Color(0xFF878787),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                width: 90.w,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF25AE4B),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(9.r),
                    bottomRight: Radius.circular(9.r),
                  ),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Add',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }



  Widget buildPaymentMethodsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pay with:',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            Radio(
              value: 'card',
              groupValue: paymentMethod,
              onChanged: (value) {
                setState(() {
                  paymentMethod = value.toString();
                });
              },
              activeColor: Color(0xFF25AE4B),
              fillColor: MaterialStateColor.resolveWith((states) {
                return paymentMethod == 'card' ? Color(0xFF25AE4B): Colors.grey;
              }),
            ),
            Text(
              'Card',
              style: TextStyle(
                  color: paymentMethod == 'card' ? Colors.black : Colors.grey,
                  fontSize: 16.sp
              ),
            ),
            SizedBox(width: 20.w),
            Radio(
              value: 'cash',
              groupValue: paymentMethod,
              onChanged: (value) {
                setState(() {
                  paymentMethod = value.toString();
                });
              },
              activeColor: Color(0xFF25AE4B),
              fillColor: MaterialStateColor.resolveWith((states) {
                return paymentMethod == 'cash' ? Color(0xFF25AE4B) : Colors.grey;
              }),
            ),
            Text(
              'Cash',
              style: TextStyle(
                  color: paymentMethod == 'cash' ? Colors.black : Colors.grey,
                  fontSize: 16.sp
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildCardTypeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Card type:',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            Radio(
              value: 'visa',
              groupValue: cardType,
              onChanged: (value) {
                setState(() {
                  cardType = value.toString();
                });
              },
              activeColor: Color(0xFF25AE4B),
              fillColor: MaterialStateColor.resolveWith((states) {
                return cardType == 'visa' ?Color(0xFF25AE4B) : Colors.grey;
              }),
            ),
            SvgPicture.asset(
              'assets/images/Visa.svg',
              width: 25.w,
              height: 17.h,
            ),
            SizedBox(width: 20.w),
            Radio(
              value: 'mastercard',
              groupValue: cardType,
              onChanged: (value) {
                setState(() {
                  cardType = value.toString();
                });
              },
              activeColor: Color(0xFF25AE4B),
              fillColor: MaterialStateColor.resolveWith((states) {
                return cardType == 'mastercard' ? Color(0xFF25AE4B) : Colors.grey;
              }),
            ),
            SvgPicture.asset(
              'assets/images/Mastercard.svg',
              width: 25.w,
              height: 17.h,
            ),
          ],
        ),
      ],
    );
  }

  void _goToMapScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MapScreen()),
    ).then((location) {
      if (location != null) {
        setState(() {
          userLocation = location;
        });
      }
    });
  }
}

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('حدد موقعك')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context, 'عنوان جديد تم تحديده');
          },
          child: Text('تأكيد الموقع'),
        ),
      ),
    );
  }
}