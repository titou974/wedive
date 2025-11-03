import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class UserMarkerAnimationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController pulseController;
  late Animation<double> pulseAnimation;
  late Animation<double> scaleAnimation;
  late Animation<double> opacityAnimation;

  @override
  void onInit() {
    super.onInit();
    _initAnimations();
  }

  void _initAnimations() {
    // Animation principale qui tourne en boucle
    pulseController = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    )..repeat();

    // Animation pour l'effet de pulse (cercle qui s'agrandit)
    pulseAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: pulseController, curve: Curves.easeOut));

    // Animation pour le bounce du cercle principal
    scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 1.0,
          end: 1.3,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 1.3,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.bounceOut)),
        weight: 50,
      ),
    ]).animate(pulseController);

    // Animation d'opacité pour l'effet de pulse
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
