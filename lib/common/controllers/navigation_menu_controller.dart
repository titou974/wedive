import 'package:Wedive/features/map/screens/map.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const MapScreen(),
    Container(color: Colors.green),
    Container(color: Colors.blue),
  ];

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    // Any initialization logic
  }

  @override
  void onClose() {
    // Clean up if needed
    super.onClose();
  }
}
