import 'package:Wedive/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find<SignUpController>();

  final pageController = PageController();
  RxInt currentPageIndex = 0.obs;
  RxList<String> selectedSports = <String>[].obs;

  // location / onboarding state
  void updatePageIndicator(int index) => {currentPageIndex.value = index};

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
