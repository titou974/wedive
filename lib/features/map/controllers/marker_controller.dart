// features/map/controllers/marker_controller.dart
import 'package:Wedive/utils/constants/lists.dart';
import 'package:Wedive/utils/constants/map.dart';
import 'package:Wedive/utils/helpers/marker_builder.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:Wedive/utils/constants/class.dart';
import 'package:Wedive/features/map/controllers/map_controller.dart'
    as app_map_ctrl;

class MarkerController extends GetxController {
  static MarkerController get instance => Get.find<MarkerController>();

  Rxn<DiveSpot> selectedSpot = Rxn<DiveSpot>();
  RxList<DiveSpot> spots = <DiveSpot>[].obs;
  RxList<Marker> markerList = <Marker>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadSpots(wediveSpotsExemples);
  }

  void loadSpots(List<DiveSpot> spotsList) {
    spots.value = spotsList;
    final selectedId = selectedSpot.value?.id;
    markerList.assignAll(
      MarkerList().buildMarkers(
        spots: spotsList,
        selectedId: selectedId,
        size: FlutterMapConstants.defaultMarkerSize,
      ),
    );
  }

  void selectSpot(DiveSpot spot) {
    selectedSpot.value = spot;

    markerList.assignAll(
      MarkerList().buildMarkers(
        spots: spots.toList(),
        selectedId: spot.id,
        size: FlutterMapConstants.defaultMarkerSize,
      ),
    );
  }

  void resetSpotSelection() {
    selectedSpot.value = null;
  }

  int? getSelectedIndex() {
    if (selectedSpot.value == null) return null;
    return spots.indexWhere((spot) => spot.id == selectedSpot.value!.id);
  }
}
