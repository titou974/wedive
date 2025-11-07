import 'package:Wedive/features/map/controllers/marker_controller.dart';
import 'package:Wedive/utils/constants/class.dart';
import 'package:Wedive/utils/constants/fr_strings.dart';
import 'package:Wedive/utils/constants/image_strings.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

final markerController = Get.find<MarkerController>();

final List<DiveSpot> wediveSpotsExemples = [
  DiveSpot(
    id: 1.toString(),
    location: LatLng(37.429725, -122.1),
    imageUrl: WediveImages.spot1,
    title: WediveTextsFr.spot1,
    grade: 8.3,
    divers: 1200,
    diversAvatars: [
      WediveImages.avatar1,
      WediveImages.avatar2,
      WediveImages.avatar3,
    ],
  ),
  DiveSpot(
    id: 2.toString(),
    location: LatLng(36.429725, -121.9),
    imageUrl: WediveImages.spot2,
    title: 'Cap La Houssaye',
    grade: 9.1,
    divers: 950,
    diversAvatars: [
      WediveImages.avatar1,
      WediveImages.avatar2,
      WediveImages.avatar3,
    ],
  ),
  DiveSpot(
    id: 3.toString(),
    location: LatLng(35.929725, -122.4),
    imageUrl: WediveImages.spot3,
    title: 'Trou d\'Eau',
    grade: 7.8,
    divers: 700,
    diversAvatars: [
      WediveImages.avatar1,
      WediveImages.avatar2,
      WediveImages.avatar3,
    ],
  ),
  DiveSpot(
    id: 4.toString(),
    location: LatLng(34.729725, -120.9),
    imageUrl: WediveImages.spot1,
    title: 'Anse des Dauphins',
    grade: 8.7,
    divers: 860,
    diversAvatars: [
      WediveImages.avatar1,
      WediveImages.avatar2,
      WediveImages.avatar3,
    ],
  ),
  DiveSpot(
    id: 5.toString(),
    location: LatLng(33.829725, -121.2),
    imageUrl: WediveImages.spot1,
    title: 'Récif du phare',
    grade: 9.0,
    divers: 1400,
    diversAvatars: [
      WediveImages.avatar1,
      WediveImages.avatar2,
      WediveImages.avatar3,
    ],
  ),
  DiveSpot(
    id: 6.toString(),
    location: LatLng(36.129725, -122.7),
    imageUrl: WediveImages.spot1,
    title: 'Gouffre Bleu',
    grade: 7.5,
    divers: 430,
    diversAvatars: [
      WediveImages.avatar1,
      WediveImages.avatar2,
      WediveImages.avatar3,
    ],
  ),
  DiveSpot(
    id: 7.toString(),
    location: LatLng(35.529725, -121.6),
    imageUrl: WediveImages.spot1,
    title: 'Les Jardins Coralliens',
    grade: 8.9,
    divers: 980,
    diversAvatars: [
      WediveImages.avatar1,
      WediveImages.avatar2,
      WediveImages.avatar3,
    ],
  ),
  DiveSpot(
    id: 8.toString(),
    location: LatLng(34.329725, -122.0),
    imageUrl: WediveImages.spot1,
    title: 'Baie des Épaves',
    grade: 9.3,
    divers: 2100,
    diversAvatars: [
      WediveImages.avatar1,
      WediveImages.avatar2,
      WediveImages.avatar3,
    ],
  ),
  DiveSpot(
    id: 9.toString(),
    location: LatLng(36.529725, -121.3),
    imageUrl: WediveImages.spot1,
    title: 'Passe du Corail',
    grade: 8.1,
    divers: 610,
    diversAvatars: [
      WediveImages.avatar1,
      WediveImages.avatar2,
      WediveImages.avatar3,
    ],
  ),
];
