import 'package:Wedive/common/widgets/map/marker.dart';
import 'package:Wedive/utils/constants/map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class SpotMarker extends StatelessWidget {
  final String imagePath;
  final double size;
  final VoidCallback? onTap;
  final bool isSelected;

  const SpotMarker({
    super.key,
    required this.imagePath,
    this.size = FlutterMapConstants.defaultMarkerSize,
    this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final avatarRadius = size * FlutterMapConstants.avatarRadiusFactor;
    final strokeColor = isSelected
        ? Theme.of(context).colorScheme.secondary
        : Theme.of(context).colorScheme.onPrimary;

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: size,
        height: size,
        child: Stack(
          alignment: Alignment.center,
          children: [
            MarkerSvg(color: strokeColor, width: size, height: size),
            Positioned(
              top: size * FlutterMapConstants.topMarkerOffset,
              child: ClipOval(
                child: Image.asset(
                  imagePath,
                  width: avatarRadius,
                  height: avatarRadius,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Marker toMarker({
    required LatLng point,
    required String imagePath,
    double size = FlutterMapConstants.defaultMarkerSize,
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
