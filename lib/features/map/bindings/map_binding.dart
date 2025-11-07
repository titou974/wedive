// lib/features/map/bindings/map_binding.dart
import 'package:get/get.dart';
import 'package:Wedive/features/map/controllers/map_controller.dart';
import 'package:Wedive/features/map/controllers/marker_controller.dart';
import 'package:Wedive/features/map/controllers/animation_controller.dart';
import 'package:Wedive/common/controllers/localisation_controller.dart';

class MapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapController>(() => MapController());
    Get.lazyPut<MarkerController>(() => MarkerController());
    Get.lazyPut<UserMarkerAnimationController>(
      () => UserMarkerAnimationController(),
    );

    if (!Get.isRegistered<LocalisationController>()) {
      Get.put<LocalisationController>(
        LocalisationController(),
        permanent: true,
      );
    }
  }
}
