import 'dart:async';

import 'package:Wedive/common/controllers/localisation_controller.dart';
import 'package:Wedive/features/map/controllers/marker_controller.dart';
import 'package:Wedive/utils/constants/class.dart'; // DiveSpot
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_map/flutter_map.dart' as fm;
import 'package:latlong2/latlong.dart';

class MapController extends GetxController {
  static MapController get instance => Get.find<MapController>();

  final LocalisationController localisationController =
      Get.find<LocalisationController>();
  final MarkerController markerController = Get.find<MarkerController>();

  fm.MapController? flutterMapController;
  final RxBool mapReady = false.obs;

  StreamSubscription<Position?>? _posSub;

  @override
  void onInit() {
    super.onInit();
    // react to localisation updates
    _posSub = localisationController.currentPosition.listen((pos) {
      if (pos == null) return;
      if (flutterMapController != null) {
        moveToPosition(pos);
      }
    });

    // react to selected spot changes (when a marker is selected elsewhere)
    markerController.selectedSpot.listen((spot) {
      if (spot != null && flutterMapController != null) {
        moveToSpot(spot);
      }
    });
  }

  /// Bind the flutter_map controller instance once the map is created.
  void bindFlutterMapController(fm.MapController controller) {
    flutterMapController = controller;
    mapReady.value = true;

    // If we already have a last-known position and follow is enabled, recenter
    final pos = localisationController.currentPosition.value;
    if (pos != null) {
      moveToPosition(pos);
    }
  }

  /// Move the map to a geolocated [Position]
  /// Uses instant move; you can replace with animated logic if you add an animated controller.
  void moveToPosition(Position pos, {double zoom = 10.0}) {
    if (flutterMapController == null) {
      debugPrint('moveToPosition: flutterMapController not bound yet');
      return;
    }
    try {
      flutterMapController!.move(LatLng(pos.latitude, pos.longitude), zoom);
    } catch (e) {
      debugPrint('moveToPosition error: $e');
    }
  }

  /// Move the map to a DiveSpot
  void moveToSpot(DiveSpot spot, {double zoom = 10.0}) {
    if (flutterMapController == null) {
      debugPrint('moveToSpot: flutterMapController not bound yet');
      return;
    }
    try {
      flutterMapController!.move(spot.location, zoom);
    } catch (e) {
      debugPrint('moveToSpot error: $e');
    }
  }

  /// Recenters on current user position (if available)
  void recenterToUser({double zoom = 14.0}) {
    final pos = localisationController.currentPosition.value;
    if (pos == null) {
      debugPrint('recenterToUser: no current position available');
      return;
    }
    moveToPosition(pos, zoom: zoom);
  }

  @override
  void onClose() {
    _posSub?.cancel();
    flutterMapController = null;
    super.onClose();
  }
}
