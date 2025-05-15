import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek_project/l10n/generated/app_localizations.dart';
import 'package:foodtek_project/view/screens/home/cart/checkout/Checkout_Screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;


class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  LatLng? selectedLocation;
  String locationAddress = '';
  bool isLoading = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    locationAddress = AppLocalizations.of(context)!.fetchingLocation;
  }

  Future<String> getAddressFromLatLng(LatLng latLng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latLng.latitude,
        latLng.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        return "${place.street ?? ''}, ${place.locality ?? ''}, ${place.country ?? ''}";
      }
      return AppLocalizations.of(context)!.unknownAddress;
    } catch (e) {
      return AppLocalizations.of(context)!.addressNotAvailable;
    }
  }

  @override
  void initState() {
    super.initState();
    _determinePosition()
        .then((position) async {
      final location = LatLng(position.latitude, position.longitude);
      String address = await getAddressFromLatLng(location);
      setState(() {
        selectedLocation = location;
        isLoading = false;
        locationAddress = address;
      });

<<<<<<< HEAD


=======
>>>>>>> cd58aa0 ( some modifications in map)
      if (mapController != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          mapController!.animateCamera(
            CameraUpdate.newLatLngZoom(location, 15),
          );
        });
      }
    })
        .catchError((error) {
      setState(() {
        locationAddress =
        "${AppLocalizations.of(context)!.failedToGetLocation} $error";
        isLoading = false;
      });
    });
  }


  Future<Position> _determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error(
        AppLocalizations.of(context)!.locationServicesDisabled,
      );
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error(
          AppLocalizations.of(context)!.locationPermissionsDenied,
        );
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        AppLocalizations.of(context)!.locationPermissionsPermanentlyDenied,
      );
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          kIsWeb
              ? GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
            },
            onTap: (LatLng latLng) async {
              String address = await getAddressFromLatLng(latLng);
              setState(() {
                selectedLocation = latLng;
                locationAddress = address;
              });
            },
            initialCameraPosition: CameraPosition(
              target: selectedLocation ?? const LatLng(31.710566, 35.218088),
              zoom: 15,
            ),
            markers: selectedLocation != null
                ? {
              Marker(
                markerId:
                MarkerId(AppLocalizations.of(context)!.selected),
                position: selectedLocation!,
                icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueGreen,
                ),
              ),
            }
                : {},
            compassEnabled: true,
            buildingsEnabled: true,
          )
              : GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
            },
            onTap: (LatLng latLng) async {
              String address = await getAddressFromLatLng(latLng);
              setState(() {
                selectedLocation = latLng;
                locationAddress = address;
              });
            },
            initialCameraPosition: CameraPosition(
              target: selectedLocation ?? const LatLng(31.710566, 35.218088),
              zoom: 15,
            ),
            markers: selectedLocation != null
                ? {
              Marker(
                markerId:
                MarkerId(AppLocalizations.of(context)!.selected),
                position: selectedLocation!,
                icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueGreen,
                ),
              ),
            }
                : {},
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            compassEnabled: true,
            buildingsEnabled: true,
          ),


          Positioned(
            top: 55.h,
            left: 30.w,
            right: 20.w,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, size: 24.sp),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),

                Container(
                  height: 40.h,
                  width: 300.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(45.r),
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
              ],
            ),
          ),
          if (!isLoading && selectedLocation != null)
            Positioned(
              bottom: 60.h,
              left: 35.w,
              right: 35.w,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(13.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Color(0xFF25AE4B),
                          size: 16.sp,
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text(
                            locationAddress,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF6C7278),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 17.h),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (selectedLocation != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => CheckoutScreen(subtotal: 100),
                              ),
                            );
                          } else {
                            Navigator.pop(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF25AE4B),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.setLocation,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
