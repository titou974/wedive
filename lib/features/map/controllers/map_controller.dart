// features/map/controllers/map_controller.dart
import 'package:Wedive/common/controllers/localisation_controller.dart';
import 'package:Wedive/features/map/controllers/marker_controller.dart';
import 'package:Wedive/features/map/controllers/marker_cache.dart';
import 'package:Wedive/utils/constants/mapbox.dart';
import 'package:Wedive/utils/constants/class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart' as mp;

class MapController extends GetxController {
  static MapController get instance => Get.find<MapController>();
  final localisationController = Get.find<LocalisationController>();
  final markerController = Get.find<MarkerController>();
  final markerCache = MarkerCache();

  mp.MapboxMap? mapboxController;
  bool _mapReady = false;

  mp.PointAnnotationManager? pointAnnotationManager;
  Map<String, mp.PointAnnotation> markers =
      {}; // Changed to Map for easier lookup

  @override
  void onInit() {
    super.onInit();

    localisationController.currentPosition.listen((pos) {
      if (pos != null) {
        debugPrint('Localisation update: ${pos.latitude}, ${pos.longitude}');
        if (_mapReady && mapboxController != null) {
          _moveCameraToPosition(pos);
        }
      }
    });

    markerController.selectedSpot.listen((spot) {
      if (spot != null && _mapReady) {
        _moveCameraToSpot(spot);
        _highlightMarker(spot);
      }
    });
  }

  Future<void> onMapCreated(mp.MapboxMap mapboxMap) async {
    mapboxController = mapboxMap;
    _mapReady = true;
    debugPrint('Map created');

    try {
      mapboxController?.scaleBar.updateSettings(
        mp.ScaleBarSettings(enabled: false),
      );
      mapboxController?.location.updateSettings(
        mp.LocationComponentSettings(enabled: true, pulsingEnabled: true),
      );

      pointAnnotationManager = await mapboxController?.annotations
          .createPointAnnotationManager();

      // Preload marker images
      await markerCache.preloadMarkers(markerController.spots);

      // Add markers for all spots
      await _addMarkersForSpots(markerController.spots);

      pointAnnotationManager?.addOnPointAnnotationClickListener(
        _MarkerClickListener(
          onMarkerClick: (annotation) {
            _onMarkerTapped(annotation);
          },
        ),
      );
    } catch (e) {
      debugPrint('Map settings error: $e');
    }

    final pos = localisationController.currentPosition.value;
    if (pos != null) {
      _moveCameraToPosition(pos);
    }

    await localisationController.startPositionStream();
  }

  Future<void> _addMarkersForSpots(List<DiveSpot> spots) async {
    if (pointAnnotationManager == null) return;

    // Clear existing markers
    if (markers.isNotEmpty) {
      await pointAnnotationManager?.deleteAll();
      markers.clear();
    }

    for (var spot in spots) {
      await _addMarkerForSpot(spot, isSelected: false);
    }

    debugPrint('Added ${markers.length} markers to map');
  }

  Future<void> _addMarkerForSpot(
    DiveSpot spot, {
    required bool isSelected,
  }) async {
    if (pointAnnotationManager == null) return;

    // Get marker image with spot photo
    final imageData = await markerCache.getMarkerImage(
      spotId: spot.id,
      spotImagePath: spot.imageUrl,
      isSelected: isSelected,
    );

    final options = mp.PointAnnotationOptions(
      geometry: mp.Point(
        coordinates: mp.Position(spot.longitude, spot.latitude),
      ),
      image: imageData,
      iconSize: 1.0,
      iconAnchor: mp.IconAnchor.BOTTOM,
      textField: spot.id, // Store spot id for identification
    );

    // Remove old marker if exists
    if (markers.containsKey(spot.id)) {
      await pointAnnotationManager?.delete(markers[spot.id]!);
    }

    final annotation = await pointAnnotationManager?.create(options);
    if (annotation != null) {
      markers[spot.id] = annotation;
    }
  }

  void _onMarkerTapped(mp.PointAnnotation annotation) {
    final spotId = annotation.textField;
    final spot = markerController.spots.firstWhereOrNull((s) => s.id == spotId);
    if (spot != null) {
      markerController.selectSpot(spot);
    }
  }

  void _moveCameraToPosition(Position position, {bool withAnimation = false}) {
    try {
      final coords = mp.Position(position.longitude, position.latitude);
      debugPrint('Moving camera to: $coords');

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

  void _moveCameraToSpot(DiveSpot spot, {bool withAnimation = true}) {
    try {
      final coords = mp.Position(spot.longitude, spot.latitude);

      if (withAnimation) {
        mapboxController?.easeTo(
          mp.CameraOptions(
            center: mp.Point(coordinates: coords),
            zoom: MapboxConstants.defaultZoomLevel,
            padding: mp.MbxEdgeInsets(
              top: 0,
              left: 0,
              bottom: 300, // Add padding to account for carousel
              right: 0,
            ),
          ),
          mp.MapAnimationOptions(duration: 1500),
        );
      } else {
        mapboxController?.setCamera(
          mp.CameraOptions(
            center: mp.Point(coordinates: coords),
            zoom: 14.0,
            padding: mp.MbxEdgeInsets(top: 0, left: 0, bottom: 300, right: 0),
          ),
        );
      }
    } catch (e) {
      debugPrint('Error moving camera to spot: $e');
    }
  }

  Future<void> _highlightMarker(DiveSpot spot) async {
    // Regenerate all markers with updated selection state
    for (var s in markerController.spots) {
      final isSelected = s.id == spot.id;
      await _addMarkerForSpot(s, isSelected: isSelected);
    }
  }

  void recenterToUser() {
    final pos = localisationController.currentPosition.value;
    if (pos == null || mapboxController == null) {
      debugPrint('recenterToUser: no position or map not ready');
      return;
    }
    _moveCameraToPosition(pos, withAnimation: true);
  }

  Future<void> reloadMarkers() async {
    await _addMarkersForSpots(markerController.spots);
  }

  @override
  void onClose() {
    pointAnnotationManager = null;
    markers.clear();
    markerCache.clearCache();
    mapboxController = null;
    _mapReady = false;
    super.onClose();
  }
}

class _MarkerClickListener extends mp.OnPointAnnotationClickListener {
  final Function(mp.PointAnnotation) onMarkerClick;

  _MarkerClickListener({required this.onMarkerClick});

  @override
  void onPointAnnotationClick(mp.PointAnnotation annotation) {
    onMarkerClick(annotation);
  }
}
