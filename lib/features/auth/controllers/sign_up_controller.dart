import 'package:geolocator/geolocator.dart';
import 'package:Wedive/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find<SignUpController>();

  final pageController = PageController();
  RxInt currentPageIndex = 0.obs;
  String? location;
  RxList<String> selectedSports = <String>[].obs;

  // location / onboarding state
  RxBool isRequestingLocation = false.obs;
  Rx<LocationPermission?> locationPermission = Rxn<LocationPermission>();
  RxBool locationServiceEnabled = false.obs;
  Position? currentPosition;

  // Request permission, obtain position and navigate when accepted
  Future<void> requestLocationAndProceed({BuildContext? context}) async {
    isRequestingLocation.value = true;
    locationServiceEnabled.value = await Geolocator.isLocationServiceEnabled();
    locationPermission.value = await Geolocator.checkPermission();

    if (!locationServiceEnabled.value) {
      // GPS off — leave state for UI to show instruction
      isRequestingLocation.value = false;
      return;
    }

    if (locationPermission.value == LocationPermission.denied) {
      final p = await Geolocator.requestPermission();
      locationPermission.value = p;
    }

    if (locationPermission.value == LocationPermission.deniedForever) {
      // permanently denied — ask user to open settings
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
        Get.offAll(NavigationMenu());
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

  void updatePageIndicator(int index) => {currentPageIndex.value = index};

  void updateLocation(String value) {
    location = value;
  }

  void updateSelectedSports(List<String> sports) {
    print('Selected sports: $sports');
    selectedSports.value = sports;
  }

  void dotNavigationClick(int index) {
    currentPageIndex.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void nextPage() {
    if (currentPageIndex.value == 1) {
      // Assuming 2 is the last page index
      // Get.to(LoginScreen()); // Navigate to the login screen
      Get.offAll(NavigationMenu());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      currentPageIndex.value = page;
    }
  }

  void previousPage() {
    int page = currentPageIndex.value - 1;
    pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    currentPageIndex.value = page;
  }
}
