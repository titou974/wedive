import 'package:Wedive/common/widgets/map/spot_marker.dart';
import 'package:Wedive/utils/constants/class.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:Wedive/features/map/controllers/marker_controller.dart';

class MarkerList {
  List<Marker> buildMarkers({
    required List<DiveSpot> spots,
    String? selectedId,
    double size = 50.0,
  }) {
    final markerList = <Marker>[];
    for (final mapItem in spots) {
      final isSelected = selectedId != null && selectedId == mapItem.id;
      markerList.add(
        SpotMarker.toMarker(
          point: mapItem.location,
          spotId: mapItem.id,
          imagePath: mapItem.imageUrl,
          isSelected: isSelected,
          size: size,
          onTap: () {
            final ctrl = Get.isRegistered<MarkerController>()
                ? Get.find<MarkerController>()
                : null;
            ctrl?.selectSpot(mapItem);
          },
        ),
      );
    }
    return markerList;
  }
}
