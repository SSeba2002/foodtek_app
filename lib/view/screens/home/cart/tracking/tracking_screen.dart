import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';
import 'package:foodtek_project/model/user_profile_model.dart';
import '../../../../widgets/tracking/driver_info_card.dart';
import 'package:foodtek_project/l10n/generated/app_localizations.dart';
import 'package:foodtek_project/view/screens/home/cart/tracking/order_details_screen.dart';

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
  final LatLng _restaurantLocation = LatLng(
    31.98801277328986,
    35.89498906471146,
  );
  LatLng _driverLocation = LatLng(32.01517354972322, 35.86903660207451);
  LatLng? _lastPosition;
  final bool _arrived = false;
  String _status = '';
  String _remainingTime = '';
  StreamSubscription<Position>? _positionStream;
  GoogleMapController? _mapController;
  Set<Polyline> _polylines = {};
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _status = AppLocalizations.of(context)!.onTheWay;
        _remainingTime = AppLocalizations.of(context)!.calculating;
      });
    });
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

    final distanceInMeters = Geolocator.distanceBetween(
      newLocation.latitude,
      newLocation.longitude,
      widget.userProfile.location.latitude,
      widget.userProfile.location.longitude,
    );

    final etaSeconds = distanceInMeters / 11.1;
    final duration = Duration(seconds: etaSeconds.round());
    final eta = "${duration.inMinutes} min";

    setState(() {
      _lastPosition = _driverLocation;
      _driverLocation = newLocation;
      _remainingTime = eta;

      _markers = {
        Marker(
          markerId: MarkerId('Foodtek'),
          position: _restaurantLocation,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          infoWindow: InfoWindow(title: "Restaurant"),
        ),
        Marker(
          markerId: MarkerId('user'),
          position: widget.userProfile.location,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          infoWindow: InfoWindow(title: "Your Location"),
        ),
        Marker(
          markerId: MarkerId('driver'),
          position: newLocation,
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueGreen,
          ),
          infoWindow: InfoWindow(title: "ETA: $_remainingTime"),
        ),
      };

      _polylines = {
        Polyline(
          polylineId: PolylineId('route'),
          points: [newLocation, widget.userProfile.location],
          color: Color(0xFF25AE4B),
          width: 4,
        ),
      };
    });

    _mapController?.animateCamera(CameraUpdate.newLatLng(newLocation));
  }

  @override
  void dispose() {
    _positionStream?.cancel();
    super.dispose();
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
                  markers: _markers,
                  polylines: _polylines,
                  onMapCreated: (controller) => _mapController = controller,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _status,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => OrderDetailsScreen(
                                  selectedLocation: widget.userProfile.location,
                                  userAddress: widget.userProfile.address,
                                ),
                          ),
                        );
                      },
                      child: Text(
                        AppLocalizations.of(context)!.allDetails,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF25AE4B),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              _buildProgressTracker(),
              DriverInfoCard(
                driverProfile: widget.driverProfile,
                context: context,
              ),
              Divider(height: 1.h, thickness: 1.h, color: Colors.grey[300]),
              _buildUserLocation(),
            ],
          ),
          Positioned(
            top: 40.h,
            left: 20.w,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black, size: 24.sp),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),

          Positioned(
            top: 40.h,
            left: 60.w,
            right: 20.w,
            child: Container(
              height: 40.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.findYourLocation,
                  hintStyle: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color(0xFF25AE4B),
                    size: 17.sp,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 8.h),
                ),
                style: TextStyle(fontSize: 14.sp),
                onSubmitted: (value) {},
              ),
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
              _buildProgressStep(
                AppLocalizations.of(context)!.orderPlaced,
                isActive: true,
              ),
              _buildProgressStep(
                AppLocalizations.of(context)!.onTheWay,
                isActive:
                    _status == AppLocalizations.of(context)!.onTheWay ||
                    _status == "Arrived",
              ),
              _buildProgressStep(
                AppLocalizations.of(context)!.delivered2,
                isActive: _status == "Arrived",
              ),
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
          Text(
            AppLocalizations.of(context)!.yourLocation,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 5.h),
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                color: Color(0xFF4CAF50),
                size: 20.w,
              ),
              SizedBox(width: 5.w),
              Expanded(
                child: Text(
                  widget.userProfile.address,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Color(0xFF6C7278),
                    fontWeight: FontWeight.w600,
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
