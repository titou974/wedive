// utils/constants/class.dart
import 'package:latlong2/latlong.dart';

class DiveSpot {
  final String id; // Add unique identifier
  final String title;
  final String imageUrl;
  final int divers;
  final List<String> diversAvatars;
  final double grade;
  final LatLng location;

  DiveSpot({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.divers,
    required this.diversAvatars,
    required this.grade,
    required this.location,
  });
}
