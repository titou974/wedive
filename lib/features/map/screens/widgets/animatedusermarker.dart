import 'package:Wedive/features/map/controllers/animation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart' as fm;
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class AnimatedUserMarker extends StatelessWidget {
  const AnimatedUserMarker({
    super.key,
    required this.position,
    required this.primaryColor,
    required this.borderColor,
  });

  final LatLng position;
  final Color primaryColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    final animController = Get.find<UserMarkerAnimationController>();

    return Stack(
      children: [
        AnimatedBuilder(
          animation: animController.pulseController,
          builder: (context, child) {
            final pulseValue = animController.pulseAnimation.value;
            final opacityValue = animController.opacityAnimation.value;

            return fm.CircleLayer(
              circles: [
                fm.CircleMarker(
                  point: position,
                  color: primaryColor.withValues(alpha: opacityValue * 0.6),
                  borderStrokeWidth: 1,
                  borderColor: primaryColor.withValues(
                    alpha: opacityValue * 0.3,
                  ),
                  radius: 6 + (25 * pulseValue),
                ),
              ],
            );
          },
        ),

        AnimatedBuilder(
          animation: animController.pulseController,
          builder: (context, child) {
            final pulseValue = animController.pulseAnimation.value;
            final opacityValue = animController.opacityAnimation.value;

            final delayedPulse = (pulseValue + 0.3).clamp(0.0, 1.0);
            final delayedOpacity = (opacityValue - 0.2).clamp(0.0, 1.0);

            return fm.CircleLayer(
              circles: [
                fm.CircleMarker(
                  point: position,
                  color: primaryColor.withValues(alpha: delayedOpacity * 0.4),
                  borderStrokeWidth: 0,
                  radius: 6 + (25 * delayedPulse),
                ),
              ],
            );
          },
        ),

        fm.CircleLayer(
          circles: [
            fm.CircleMarker(
              point: position,
              color: primaryColor.withValues(alpha: 0.8),
              borderStrokeWidth: 2.5,
              borderColor: borderColor,
              radius: 10,
            ),
          ],
        ),
      ],
    );
  }
}
