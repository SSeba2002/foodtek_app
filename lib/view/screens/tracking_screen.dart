
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';
import 'package:foodtek_project/model/user_profile_model.dart';
import '../widgets/driver_info_card.dart';

class TrackingScreen extends StatefulWidget {
  final UserProfile driverProfile;
  final UserProfile userProfile;

  const TrackingScreen({
    super.key,
    required this.driverProfile,
    required this.userProfile,
  });

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  final TextEditingController _searchController = TextEditingController();
  LatLng _restaurantLocation = LatLng(31.98801277328986, 35.89498906471146);
  LatLng _driverLocation = LatLng(32.01517354972322, 35.86903660207451);
  LatLng? _lastPosition;
  bool _arrived = false;
  String _status = "On The Way";
  String _remainingTime = "Calculating...";
  StreamSubscription<Position>? _positionStream;
  GoogleMapController? _mapController;

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }

  Future<void> _checkLocationPermission() async {
    final status = await Permission.location.request();
    if (status.isGranted) {
      _startTracking();
    }
  }

  void _startTracking() {
    _positionStream = Geolocator.getPositionStream().listen((position) {
      _updateDriverPosition(position);
    });
  }

  void _updateDriverPosition(Position position) {
    final newLocation = LatLng(position.latitude, position.longitude);
    setState(() {
      _lastPosition = _driverLocation;
      _driverLocation = newLocation;
    });
    _mapController?.animateCamera(CameraUpdate.newLatLng(newLocation));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 2,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: _driverLocation,
                    zoom: 15,
                  ),
                  markers: {
                    Marker(
                      markerId: MarkerId('Foodtek'),
                      position: _restaurantLocation,
                      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
                    ),
                    Marker(
                      markerId: MarkerId('user'),
                      position: widget.userProfile.location,
                      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
                    ),
                    Marker(
                      markerId: MarkerId('driver'),
                      position: _driverLocation,
                      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
                    ),
                  },
                  polylines: {
                    Polyline(
                      polylineId: PolylineId('route'),
                      points: [_restaurantLocation, widget.userProfile.location],
                      color: Color(0xFF25AE4B),
                      width: 3,
                    ),
                  },
                  onMapCreated: (controller) => _mapController = controller,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _status,
                      style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text("All Details",
                          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: Color(0xFF25AE4B))),
                    ),
                  ],
                ),
              ),
              _buildProgressTracker(),
              DriverInfoCard(driverProfile: widget.driverProfile), // ← هنا استدعاء الويدجت
              Divider(height: 1.h, thickness: 1.h, color: Colors.grey[300]),
              _buildUserLocation(),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 37.h,
            left: 10.w,
            right: 10.w,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, size: 20.w),
                  onPressed: () => Navigator.pop(context),
                ),
                Expanded(
                  child: Container(
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.r),
                      border: Border.all(color: Colors.grey, width: 0.5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          spreadRadius: 0.5,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 8.w),
                          child: Icon(Icons.search, color: Color(0xFF25AE4B), size: 20.w),
                        ),
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              hintText: 'Find your location',
                              hintStyle: TextStyle(
                                  color: Color(0xFF878787),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
                            ),
                            style: TextStyle(fontSize: 12.sp),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressTracker() {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildProgressStep("Order Placed", isActive: true),
              _buildProgressStep("On The Way", isActive: _status == "On The Way" || _status == "Arrived"),
              _buildProgressStep("Delivered", isActive: _status == "Arrived"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProgressStep(String title, {required bool isActive}) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: isActive ? Color(0xFF25AE4B) : Colors.grey,
          ),
        ),
        SizedBox(height: 6.h),
        Container(
          height: 4.h,
          width: 80.w,
          color: isActive ? Color(0xFF25AE4B) : Colors.grey,
        ),
      ],
    );
  }

  Widget _buildUserLocation() {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Your Location",
              style: TextStyle(color: Colors.grey, fontSize: 12.sp, fontWeight: FontWeight.w500)),
          SizedBox(height: 5.h),
          Row(
            children: [
              Icon(Icons.location_on_outlined, color: Color(0xFF4CAF50), size: 20.w),
              SizedBox(width: 5.w),
              Expanded(
                child: Text(widget.userProfile.address,
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: Color(0xFF6C7278),
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}