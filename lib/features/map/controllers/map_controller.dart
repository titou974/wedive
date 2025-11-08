import 'dart:async';
import 'package:Wedive/common/controllers/localisation_controller.dart';
import 'package:Wedive/features/map/controllers/marker_controller.dart';
import 'package:Wedive/utils/constants/class.dart';
import 'package:Wedive/utils/constants/map.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:latlong2/latlong.dart';

class MapController extends GetxController {
  static MapController get instance => Get.find<MapController>();

  final LocalisationController localisationController =
      Get.find<LocalisationController>();
  final MarkerController markerController = Get.find<MarkerController>();

  AnimatedMapController? animatedMapController;

  final RxBool mapReady = false.obs;

  StreamSubscription<Position?>? _posSub;

  @override
  void onInit() {
    super.onInit();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final granted = await localisationController.requestLocationAndProceed(
        navigateOnSuccess: false,
      );
      if (granted) {
        await localisationController.startPositionStream();
      }
    });

    _posSub = localisationController.currentPosition.listen((pos) {
      if (pos == null || markerController.selectedSpot.value != null) return;
      if (animatedMapController != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          moveToPosition(pos);
        });
      }
    });

    markerController.selectedSpot.listen((spot) {
      if (spot == null) return;
      if (animatedMapController != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          moveToSpot(spot);
        });
      }
    });
  }

  void bindFlutterMapController(AnimatedMapController controller) {
    animatedMapController = controller;
    mapReady.value = true;
    final selected = markerController.selectedSpot.value;
    if (selected != null) {
      moveToSpot(selected);
      return;
    }
    final pos = localisationController.currentPosition.value;
    if (pos != null) {
      moveToPosition(pos);
    }
  }

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
