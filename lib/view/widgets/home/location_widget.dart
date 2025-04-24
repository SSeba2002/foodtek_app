import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek_project/view/screens/home/cart/checkout/map_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class LocationWidget extends StatefulWidget {
  final String initialLocation;

  const LocationWidget({super.key, this.initialLocation = ""});

  @override
  _LocationWidgetState createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  late String _selectedLocation;

  @override
  void initState() {
    super.initState();
    _selectedLocation = widget.initialLocation;
  }

  void _openMapScreen(BuildContext context) async {
    final newLocation = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MapScreen()),
    );

    if (newLocation != null && newLocation is LatLng) {

      final address = await _getAddressFromLatLng(newLocation);
      setState(() {
        _selectedLocation = address;
      });
    }
  }

  Future<String> _getAddressFromLatLng(LatLng latLng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latLng.latitude,
        latLng.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        return "${place.street ?? ''}, ${place.locality ?? ''}, ${place.country ?? ''}";
      }
      return "Unknown Address";
    } catch (e) {
      return "Address Not Available";
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openMapScreen(context),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(5.w),
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(
              Icons.location_on_outlined,
              color: Colors.green,
              size: 20.w,
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Current Location",
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  _selectedLocation.isEmpty ? "Add Location" : _selectedLocation,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: _selectedLocation.isEmpty ? Colors.grey : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}