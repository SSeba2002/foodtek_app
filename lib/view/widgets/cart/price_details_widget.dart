import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek_project/l10n/generated/app_localizations.dart';

class PriceDetailsWidget extends StatelessWidget {
  final double subtotal;
  final VoidCallback onPlaceOrder;
  final double? deliveryCharge;
  final double? discount;
  //   final String? userLocation;
  //  final LatLng? selectedLocation;

  const PriceDetailsWidget({
    super.key,
    required this.subtotal,
    required this.onPlaceOrder,
    this.deliveryCharge,
    this.discount,
    // this.selectedLocation,
    // this.userLocation
  });

  double calculateDeliveryCharge(double subtotal) {
    return subtotal > 20 ? 0 : 2;
  }

  double calculateDiscount(double subtotal) {
    return subtotal > 20 ? 20.0 : 0;
  }

  double get total {
    return subtotal +
        (deliveryCharge ?? calculateDeliveryCharge(subtotal)) -
        (discount ?? calculateDiscount(subtotal));
  }

  @override
  Widget build(BuildContext context) {
    final calculatedDelivery =
        deliveryCharge ?? calculateDeliveryCharge(subtotal);
    final calculatedDiscount = discount ?? calculateDiscount(subtotal);
    return Container(
      margin: EdgeInsets.fromLTRB(18.w, 0, 18.w, 55.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(11.r),
        image: DecorationImage(
          image: AssetImage('assets/images/financial_details_card.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildPaymentRow(
            AppLocalizations.of(context)!.subTotal,
            subtotal.toStringAsFixed(2),
          ),
          SizedBox(height: 2.h),
          _buildPaymentRow(
            AppLocalizations.of(context)!.deliveryCharge,
            calculatedDelivery.toStringAsFixed(2),
          ),
          SizedBox(height: 2.h),
          _buildPaymentRow(
            AppLocalizations.of(context)!.discount,
            '-${calculatedDiscount.toStringAsFixed(2)}',
          ),
          SizedBox(height: 2.h),
          _buildPaymentRow(
            AppLocalizations.of(context)!.total,
            total.toStringAsFixed(2),
            isTotal: true,
          ),
          SizedBox(height: 14.h),
          SizedBox(
            height: 48.h,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              onPressed: onPlaceOrder,

              child: Text(
                AppLocalizations.of(context)!.placeOrder,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF25AE4B),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: isTotal ? 18.sp : 15.sp,
              fontWeight: isTotal ? FontWeight.w700 : FontWeight.w400,
            ),
          ),
          Text(
            '$value JD',
            style: TextStyle(
              fontSize: isTotal ? 18.sp : 15.sp,
              fontWeight: isTotal ? FontWeight.w700 : FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
