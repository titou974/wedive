// lib/common/bindings/navigation_binding.dart
import 'package:Wedive/common/controllers/navigation_menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Wedive/common/controllers/localisation_controller.dart';
import 'package:Wedive/features/map/bindings/map_binding.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationController>(() => NavigationController());

    if (!Get.isRegistered<LocalisationController>()) {
      Get.put<LocalisationController>(
        LocalisationController(),
        permanent: true,
      );
    }

    _initializeTabControllers();
  }

  void _initializeTabControllers() {
    MapBinding().dependencies();
  }
}
