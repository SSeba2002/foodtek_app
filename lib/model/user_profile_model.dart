import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserProfile {
  final String userId;
  final String name;
  final String address;
  final LatLng location;
  final String profileImageUrl;

  const UserProfile({
    required this.userId,
    required this.name,
    required this.address,
    required this.location,
    required this.profileImageUrl,
  });
}