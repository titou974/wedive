// lib/features/auth/bindings/onboarding_binding.dart
import 'package:get/get.dart';
import 'package:Wedive/features/auth/controllers/onboarding_controller.dart';

class OnBoardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnBoardingController>(() => OnBoardingController());
  }
}
