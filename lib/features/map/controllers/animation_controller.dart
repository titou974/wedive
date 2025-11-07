import 'package:Wedive/utils/constants/map.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class UserMarkerAnimationController extends GetxController
    with GetTickerProviderStateMixin {
  late AnimationController pulseController;
  late Animation<double> pulseAnimation;
  late Animation<double> opacityAnimation;

  @override
  void onInit() {
    super.onInit();
    _initAnimations();
    startAnimation();
  }

  void _initAnimations() {
    pulseController = AnimationController(
      duration: const Duration(milliseconds: FlutterMapConstants.duration),
      vsync: this,
    )..repeat();

    pulseAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: pulseController, curve: Curves.easeOut));

    opacityAnimation = Tween<double>(
      begin: 0.5,
      end: 0.0,
    ).animate(CurvedAnimation(parent: pulseController, curve: Curves.easeOut));
  }

  void startAnimation() {
    if (!pulseController.isAnimating) {
      pulseController.repeat();
    }
  }

  void stopAnimation() {
    pulseController.stop();
  }

  @override
  void onClose() {
    pulseController.dispose();
    super.onClose();
  }
}
