import 'dart:async';

import 'package:Wedive/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocalisationController extends GetxController {
  static LocalisationController get instance =>
      Get.find<LocalisationController>();
  String? location;
  LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 10,
  );
  RxBool isRequestingLocation = false.obs;
  Rx<LocationPermission?> locationPermission = Rxn<LocationPermission>();
  RxBool locationServiceEnabled = false.obs;

  // expose current position as reactive value
  Rxn<Position> currentPosition = Rxn<Position>();

  StreamSubscription? userPositionStream;

  void updateLocation(String value) {
    location = value;
  }

  /// Request permission, obtain current position.
  /// If [navigateOnSuccess] is true, navigate to NavigationMenu when a position is obtained.
  /// Returns true if permission granted and position obtained.
  Future<bool> requestLocationAndProceed({
    BuildContext? context,
    bool navigateOnSuccess = false,
  }) async {
    isRequestingLocation.value = true;
    locationServiceEnabled.value = await Geolocator.isLocationServiceEnabled();
    locationPermission.value = await Geolocator.checkPermission();

    if (!locationServiceEnabled.value) {
      isRequestingLocation.value = false;
      return false;
    }

    if (locationPermission.value == LocationPermission.denied) {
      final p = await Geolocator.requestPermission();
      locationPermission.value = p;
    }

    if (locationPermission.value == LocationPermission.deniedForever) {
      await Geolocator.openAppSettings();
      isRequestingLocation.value = false;
      return false;
    }

    if (locationPermission.value == LocationPermission.always ||
        locationPermission.value == LocationPermission.whileInUse) {
      try {
        // set immediate current position
        final pos = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best,
        );
        currentPosition.value = pos;
        location = '${pos.latitude},${pos.longitude}';
        debugPrint('Obtained position: ${pos.latitude}, ${pos.longitude}');
        if (navigateOnSuccess) {
          // Only navigate when explicitly requested (so other callers won't be redirected)
          Get.offAll(NavigationMenu());
          isRequestingLocation.value = false;
          return true;
        }
        isRequestingLocation.value = false;
        return true;
      } catch (e) {
        debugPrint('Error getting position: $e');
      }
    }

    isRequestingLocation.value = false;
    return false;
  }

  Future<void> startPositionStream() async {
    // cancel any existing stream
    await userPositionStream?.cancel();
    // only start if permission ok
    if (locationPermission.value == LocationPermission.always ||
        locationPermission.value == LocationPermission.whileInUse) {
      userPositionStream =
          Geolocator.getPositionStream(
            locationSettings: locationSettings,
          ).listen((Position? pos) {
            if (pos != null) {
              currentPosition.value = pos;
            }
          });
    }
  }

  Future<void> stopPositionStream() async {
    await userPositionStream?.cancel();
    userPositionStream = null;
  }

  Future<void> recheckLocationPermission() async {
    // helper to re-evaluate permission/service state without navigation
    locationServiceEnabled.value = await Geolocator.isLocationServiceEnabled();
    locationPermission.value = await Geolocator.checkPermission();
  }

  @override
  void onClose() {
    userPositionStream?.cancel();
    super.onClose();
  }
}
