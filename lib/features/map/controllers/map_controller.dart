import 'dart:async';

import 'package:Wedive/common/controllers/localisation_controller.dart';
import 'package:Wedive/features/map/controllers/marker_controller.dart';
import 'package:Wedive/utils/constants/class.dart'; // DiveSpot
import 'package:Wedive/utils/constants/map.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart'
    as fm_animation;
import 'package:flutter_map/flutter_map.dart' as fm;
import 'package:latlong2/latlong.dart';

class MapController extends GetxController {
  static MapController get instance => Get.find<MapController>();

  final LocalisationController localisationController =
      Get.find<LocalisationController>();
  final MarkerController markerController = Get.find<MarkerController>();

  fm.MapController? flutterMapController;
  fm_animation.AnimatedMapController? animatedMapController;

  final RxBool mapReady = false.obs;

  StreamSubscription<Position?>? _posSub;

  @override
  void onInit() {
    super.onInit();
    // react to localisation updates
    _posSub = localisationController.currentPosition.listen((pos) {
      if (pos == null) return;
      if (animatedMapController != null) {
        moveToPosition(pos);
      }
    });

    // react to selected spot changes (when a marker is selected elsewhere)
    markerController.selectedSpot.listen((spot) {
      if (spot != null && animatedMapController != null) {
        moveToSpot(spot);
      }
    });
  }

  /// Bind the flutter_map controller instance once the map is created.
  void bindFlutterMapController(fm_animation.AnimatedMapController controller) {
    animatedMapController = controller;
    mapReady.value = true;

    // If a spot is already selected when the map becomes ready, center to it.
    // Otherwise, fall back to last known user position.
    Future.microtask(() {
      final selected = markerController.selectedSpot.value;
      if (selected != null) {
        // prefer centering on the selected spot
        moveToSpot(selected);
        return;
      }
      final pos = localisationController.currentPosition.value;
      if (pos != null) {
        moveToPosition(pos);
      }
    });
  }

  /// Move the map to a geolocated [Position]
  /// Uses instant move; you can replace with animated logic if you add an animated controller.
  void moveToPosition(
    Position pos, {
    double zoom = FlutterMapConstants.defaultZoomLevel,
  }) {
    if (animatedMapController == null) {
      debugPrint('moveToPosition: animatedMapController not bound yet');
      return;
    }
    try {
      animatedMapController!.animateTo(
        dest: LatLng(pos.latitude, pos.longitude),
        zoom: zoom,
      );
    } catch (e) {
      debugPrint('moveToPosition error: $e');
    }
  }

  void moveToSpot(
    DiveSpot spot, {
    double zoom = FlutterMapConstants.defaultZoomLevel,
  }) {
    if (animatedMapController == null) {
      debugPrint('moveToSpot: animatedMapController not bound yet');
      return;
    }
    try {
      animatedMapController!.animateTo(dest: spot.location, zoom: zoom);
    } catch (e) {
      debugPrint('moveToSpot error: $e');
    }
  }

  /// Recenters on current user position (if available)
  void recenterToUser({double zoom = FlutterMapConstants.defaultZoomLevel}) {
    final pos = localisationController.currentPosition.value;
    if (pos == null) {
      debugPrint('recenterToUser: no current position available');
      return;
    }
    markerController.resetSpotSelection();
    moveToPosition(pos, zoom: zoom);
  }

  @override
  void onClose() {
    _posSub?.cancel();
    animatedMapController = null;
    super.onClose();
  }
}
