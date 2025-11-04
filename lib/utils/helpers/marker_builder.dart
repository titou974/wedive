import 'package:Wedive/common/widgets/map/spot_marker.dart';
import 'package:Wedive/utils/constants/lists.dart';
import 'package:Wedive/utils/constants/map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class MarkerList {
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
          size: FlutterMapConstants.defaultMarkerSize,
        ),
      );
    }
    return markerList;
  }
}
