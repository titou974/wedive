// lib/features/auth/bindings/signup_binding.dart
import 'package:Wedive/common/controllers/localisation_controller.dart';
import 'package:Wedive/features/auth/controllers/signup_controller.dart';
import 'package:get/get.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController());
    Get.put<LocalisationController>(
      LocalisationController(),
      permanent: true, // Stays alive across routes
    );
  }
}
