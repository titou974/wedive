import 'package:Wedive/common/controllers/localisation_controller.dart';
import 'package:Wedive/utils/constants/mapbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart' as mp;

class MapController extends GetxController {
  static MapController get instance => Get.find<MapController>();
  final localisationController = Get.find<LocalisationController>();

  mp.MapboxMap? mapboxController;
  bool _mapReady = false;

  @override
  void onInit() {
    super.onInit();
    // Écoute les changements de position et recentre si la map est prête
    localisationController.currentPosition.listen((pos) {
      if (pos != null) {
        debugPrint('Localisation update: ${pos.latitude}, ${pos.longitude}');
        if (_mapReady && mapboxController != null) {
          _moveCameraToPosition(pos);
        }
      }
    });
  }

  // appelé depuis MapWidget.onMapCreated
  Future<void> onMapCreated(mp.MapboxMap mapboxMap) async {
    mapboxController = mapboxMap;
    _mapReady = true;
    debugPrint('Map created');

    try {
      // Désactiver scale bar / activer location puck (UI only)
      mapboxController?.scaleBar.updateSettings(
        mp.ScaleBarSettings(enabled: false),
      );
      mapboxController?.location.updateSettings(
        mp.LocationComponentSettings(enabled: true, pulsingEnabled: true),
      );
    } catch (e) {
      debugPrint('Map settings error: $e');
    }

    // si on a déjà une position connue, recentre immédiatement
    final pos = localisationController.currentPosition.value;
    if (pos != null) {
      _moveCameraToPosition(pos);
    }

    // démarrer le stream de positions si besoin
    await localisationController.startPositionStream();
  }

  void _moveCameraToPosition(Position position, {bool withAnimation = false}) {
    try {
      final coords = mp.Position(
        position.longitude,
        position.latitude,
      ); // lon, lat
      debugPrint('Moving camera t PROUT: ${coords}');
      // ease to could be used for animation
      if (withAnimation) {
        mapboxController?.easeTo(
          mp.CameraOptions(
            center: mp.Point(coordinates: coords),
            zoom: MapboxConstants.defaultZoomLevel,
          ),
          mp.MapAnimationOptions(duration: 2000),
        );
        return;
      }
      mapboxController?.setCamera(
        mp.CameraOptions(
          center: mp.Point(coordinates: coords),
          zoom: MapboxConstants.defaultZoomLevel,
        ),
      );
    } catch (e) {
      debugPrint('Error moving camera: $e');
    }
  }

  // Recenter map to current user position (if available)
  void recenterToUser() {
    final pos = localisationController.currentPosition.value;
    if (pos == null || mapboxController == null) {
      debugPrint('recenterToUser: no position or map not ready');
      return;
    }
    _moveCameraToPosition(pos, withAnimation: true);
  }

  @override
  void onClose() {
    mapboxController = null;
    _mapReady = false;
    super.onClose();
  }
}
