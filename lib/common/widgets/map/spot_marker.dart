import 'package:Wedive/common/widgets/map/marker.dart';
import 'package:Wedive/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latlong2/latlong.dart';

class SpotMarker extends StatelessWidget {
  final String imagePath;
  final double size;
  final VoidCallback? onTap;
  final bool isSelected;

  const SpotMarker({
    super.key,
    required this.imagePath,
    this.size = 50.0,
    this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    // avatar radius depends on actual rendered size
    final avatarRadius = size * 0.37; // tweak to fit inside SVG marker

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: size,
        height: size,
        // AnimatedContainer must animate the width/height properties
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
          width: size,
          height: size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              MarkerSvg(
                color: isSelected
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.onPrimary,
                width: size,
                height: size,
              ),
              Positioned(
                top:
                    size *
                    0.06, // adjust to visually center the avatar inside marker
                child: ClipOval(
                  child: Image.asset(
                    imagePath,
                    width: avatarRadius * 2,
                    height: avatarRadius * 2,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Marker toMarker({
    required LatLng point,
    required String imagePath,
    double size = 50.0,
    VoidCallback? onTap,
    bool isSelected = false,
  }) {
    return Marker(
      point: point,
      width: size,
      height: size,
      child: SpotMarker(
        imagePath: imagePath,
        size: size,
        onTap: onTap,
        isSelected: isSelected,
      ),
    );
  }
}
