import 'package:flutter/material.dart';
import 'package:foodtek_project/l10n/generated/app_localizations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  LatLng? selectedLocation;
  late String locationAddress;

@override
void didChangeDependencies() {
  super.didChangeDependencies();
  locationAddress = AppLocalizations.of(context)!.fetchingLocation;
}
  @override
  void initState() {
    super.initState();
    _determinePosition().then((position) {
      setState(() {
        selectedLocation = LatLng(position.latitude, position.longitude);
      });
    }).catchError((error) {
      setState(() {
        locationAddress = "${AppLocalizations.of(context)!.failedToGetLocation} $error";
      });
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error(AppLocalizations.of(context)!.locationServicesDisabled);
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error(AppLocalizations.of(context)!.locationPermissionsDenied);
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(AppLocalizations.of(context)!.locationPermissionsPermanentlyDenied);
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              setState(() {
                mapController = controller;
              });
            },
            onTap: (LatLng latLng) {
              setState(() {
                selectedLocation = latLng;
              });
            },
            markers: selectedLocation != null
                ? {
                    Marker(
                      markerId:  MarkerId(AppLocalizations.of(context)!.selected,),
                      position: selectedLocation!,
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueGreen),
                    ),
                  }
                : {},
            initialCameraPosition: CameraPosition(
              target: selectedLocation ?? const LatLng(31.710566, 35.218088),
              zoom: 15,
            ),
          ),
          Positioned(
            top: 40,
            left: 15,
            right: 15,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    spreadRadius: 2,
                  )
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.findYourLocation,
                  border: InputBorder.none,
                  prefixIcon: const Icon(Icons.search, color: Colors.green),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
