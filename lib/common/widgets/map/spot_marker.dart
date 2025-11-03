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
    // AnimatedContainer will animate width/height when `size` changes
    final avatarRadius = size * 0.37; // tweak to fit inside SVG marker
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: size,
        height: size,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: size,
          height: size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                isSelected
                    ? WediveImages.marketSelectedSvg
                    : WediveImages.markerSvg,
                width: size,
                height: size,
              ),
              Positioned(
                top:
                    size *
                    0.06, // adjust to visually center the avatar inside marker
                child: CircleAvatar(
                  radius: avatarRadius,
                  backgroundImage: AssetImage(imagePath),
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
