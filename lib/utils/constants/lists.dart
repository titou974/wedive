import 'package:Wedive/common/widgets/map/spot_marker.dart';
import 'package:Wedive/features/map/controllers/marker_controller.dart';
import 'package:Wedive/utils/constants/class.dart';
import 'package:Wedive/utils/constants/fr_strings.dart';
import 'package:Wedive/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

final markerController = Get.find<MarkerController>();

final List<DiveSpot> spots = [
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
  // Add more spots as needed
];

class MarkerList {
  // make public
  List<Marker> buildMarkers() {
    final markerList = <Marker>[];
    for (int i = 0; i < spots.length; i++) {
      final mapItem = spots[i];
      final isSelected = markerController.selectedSpot.value?.id == mapItem.id;
      markerList.add(
        SpotMarker.toMarker(
          imagePath: mapItem.imageUrl,
          onTap: () {
            debugPrint('Marker ${mapItem.id} tapped!');
            markerController.selectSpot(mapItem);
          },
          point: mapItem.location,
          isSelected: isSelected,
          size: isSelected ? 60.0 : 50.0,
        ),
      );
    }
    return markerList;
  }
}
