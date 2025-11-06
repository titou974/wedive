// features/map/controllers/marker_controller.dart
import 'package:Wedive/utils/helpers/marker_builder.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:Wedive/utils/constants/class.dart';
import 'package:Wedive/features/map/controllers/map_controller.dart'
    as app_map_ctrl;

class MarkerController extends GetxController {
  static MarkerController get instance => Get.find<MarkerController>();

  // Selected spot (reactive)
  Rxn<DiveSpot> selectedSpot = Rxn<DiveSpot>();

  // All spots
  RxList<DiveSpot> spots = <DiveSpot>[].obs;
  // make marker list reactive
  RxList<Marker> markerList = <Marker>[].obs;

  void selectSpot(DiveSpot spot) {
    selectedSpot.value = spot;

    // rebuild marker list using single builder so each SpotMarker can animate its size
    markerList.assignAll(MarkerList().buildMarkers());

    // move map to selected spot if MapController is available
    if (Get.isRegistered<app_map_ctrl.MapController>()) {
      try {
        Get.find<app_map_ctrl.MapController>().moveToSpot(spot);
      } catch (e) {
        debugPrint('Error moving to spot from MarkerController: $e');
      }
    }
  }

  void loadSpots(List<DiveSpot> spotsList) {
    spots.value = spotsList;
    markerList.assignAll(MarkerList().buildMarkers());
  }

  void resetSpotSelection() {
    selectedSpot.value = null;
  }

  int? getSelectedIndex() {
    if (selectedSpot.value == null) return null;
    return spots.indexWhere((spot) => spot.id == selectedSpot.value!.id);
  }
}
