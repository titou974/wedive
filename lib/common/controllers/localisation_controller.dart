import 'dart:async';

import 'package:Wedive/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocalisationController extends GetxController {
  String? location;
  LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 10,
  );
  RxBool isRequestingLocation = false.obs;
  Rx<LocationPermission?> locationPermission = Rxn<LocationPermission>();
  RxBool locationServiceEnabled = false.obs;
  Position? currentPosition;
  StreamSubscription? userPositionStream;

  void updateLocation(String value) {
    location = value;
  }

  Future<void> requestLocationAndProceed({BuildContext? context}) async {
    isRequestingLocation.value = true;
    locationServiceEnabled.value = await Geolocator.isLocationServiceEnabled();
    locationPermission.value = await Geolocator.checkPermission();

    if (!locationServiceEnabled.value) {
      isRequestingLocation.value = false;
      return;
    }

    if (locationPermission.value == LocationPermission.denied) {
      final p = await Geolocator.requestPermission();
      locationPermission.value = p;
    }

    if (locationPermission.value == LocationPermission.deniedForever) {
      await Geolocator.openAppSettings();
      isRequestingLocation.value = false;
      return;
    }

    if (locationPermission.value == LocationPermission.always ||
        locationPermission.value == LocationPermission.whileInUse) {
      try {
        currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best,
        );
        location = '${currentPosition!.latitude},${currentPosition!.longitude}';
        // Immediately navigate to main app once location accepted

        // Get.offAll(NavigationMenu());
      } catch (e) {
        debugPrint('Error getting position: $e');
      }
    }

    isRequestingLocation.value = false;
  }

  Future<void> recheckLocationPermission() async {
    // helper to re-evaluate permission/service state without navigation
    locationServiceEnabled.value = await Geolocator.isLocationServiceEnabled();
    locationPermission.value = await Geolocator.checkPermission();
  }
}
