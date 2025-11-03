import 'dart:async';

import 'package:Wedive/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocalisationController extends GetxController {
  static LocalisationController get instance =>
      Get.find<LocalisationController>();

  String? location;

  // ✅ Déclarer comme RxnString (nullable reactive string)
  final RxnString cityName = RxnString();
  final RxnString countryName = RxnString();

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

  // ✅ Pour throttling du geocoding
  DateTime? _lastGeocodingCall;
  static const _geocodingThrottle = Duration(seconds: 30);

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

        // ✅ Mettre à jour le placemark
        await _updatePlacemark(pos);

        if (navigateOnSuccess) {
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

  // ✅ Méthode corrigée pour mettre à jour le placemark
  Future<void> _updatePlacemark(Position pos) async {
    // ✅ Throttle pour éviter trop d'appels
    final now = DateTime.now();
    if (_lastGeocodingCall != null &&
        now.difference(_lastGeocodingCall!) < _geocodingThrottle) {
      return; // Ignorer cet appel
    }

    _lastGeocodingCall = now;

    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        pos.latitude,
        pos.longitude,
      );
      if (placemarks.isNotEmpty) {
        final placemark = placemarks.first;
        cityName.value = placemark.locality ?? placemark.subAdministrativeArea;
        countryName.value = placemark.country;
        debugPrint(
          'Updated placemark: ${cityName.value}, ${countryName.value}',
        );
      }
    } catch (e) {
      debugPrint('Error getting placemark: $e');
    }
  }

  Future<void> startPositionStream() async {
    await userPositionStream?.cancel();

    if (locationPermission.value == LocationPermission.always ||
        locationPermission.value == LocationPermission.whileInUse) {
      userPositionStream =
          Geolocator.getPositionStream(
            locationSettings: locationSettings,
          ).listen((Position? pos) async {
            if (pos != null) {
              currentPosition.value = pos;
              // Mettre à jour le placemark (throttled)
              await _updatePlacemark(pos);
            }
          });
    }
  }

  Future<void> stopPositionStream() async {
    await userPositionStream?.cancel();
    userPositionStream = null;
  }

  Future<void> recheckLocationPermission() async {
    locationServiceEnabled.value = await Geolocator.isLocationServiceEnabled();
    locationPermission.value = await Geolocator.checkPermission();
  }

  @override
  void onClose() {
    userPositionStream?.cancel();
    super.onClose();
  }
}
