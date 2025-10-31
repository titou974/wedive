import 'package:Wedive/common/controllers/localisation_controller.dart';
import 'package:geolocator/geolocator.dart' as gl;
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart' as mp;

class MapController extends GetxController {
  static MapController get instance => Get.find<MapController>();
  final localisationController = Get.put(LocalisationController());
  mp.MapboxMap? mapboxController;

  void onMapCreated(mp.MapboxMap mapboxMap) {
    mapboxController = mapboxMap;

    // Disable the scale bar
    mapboxController?.scaleBar.updateSettings(
      mp.ScaleBarSettings(enabled: false),
    );

    // Update the location of the user
    mapboxController?.location.updateSettings(
      mp.LocationComponentSettings(enabled: true, pulsingEnabled: true),
    );

    setupPositionTracking();
  }

  Future<void> setupPositionTracking() async {
    bool serviceEnabled;
    gl.LocationPermission permission;

    serviceEnabled = await gl.Geolocator.isLocationServiceEnabled();

    await localisationController.requestLocationAndProceed();
    await getPositionStream();
  }

  Future<void> getPositionStream() async {
    localisationController.userPositionStream?.cancel();
    if (localisationController.locationPermission.value ==
            LocationPermission.always ||
        localisationController.locationPermission.value ==
            LocationPermission.whileInUse) {
      localisationController.userPositionStream =
          Geolocator.getPositionStream(
            locationSettings: localisationController.locationSettings,
          ).listen((Position? position) {
            if (position != null && mapboxController != null) {
              print(
                'New position: ${position.latitude}, ${position.longitude}',
              );
              mapboxController?.setCamera(
                mp.CameraOptions(
                  center: mp.Point(
                    coordinates: mp.Position(
                      position.longitude,
                      position.latitude,
                    ),
                  ),
                  zoom: 14.0,
                ),
              );
            }
          });
    }
  }
}
