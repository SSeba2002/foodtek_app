import 'package:flutter/material.dart';
import 'package:foodtek_project/l10n/generated/app_localizations.dart';
import 'package:foodtek_project/view/screens/auth/login_screen.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Future<void> _turnOnLocation() async {
    // Check site permission status
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      // Request permission to access the site if it is not granted
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // If the user denies permission, show a message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context)!.locationAccessRequired)),
        );
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // If the permission is permanently blocked, redirect the user to the phone settings.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
          AppLocalizations.of(context)!.locationPermissionDenied,
          ),
        ),
      );
      return;
    }

    // get current location
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // Go to the next screen after activating the site
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: _turnOnLocation,
          child: Text(AppLocalizations.of(context)!.turnOn),
        ),
      ),
    );
  }
}
