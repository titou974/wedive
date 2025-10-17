import 'package:get/get.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class MapController extends GetxController {
  static MapController get instance => Get.find<MapController>();

  MapboxMap? mapboxController;

  void onMapCreated(MapboxMap mapboxMap) {
    mapboxController = mapboxMap;

    // Disable the scale bar
    mapboxController?.scaleBar.updateSettings(ScaleBarSettings(enabled: false));

    // Update the location of the user
    mapboxController?.location.updateSettings(
      LocationComponentSettings(enabled: true),
    );
  }
}
