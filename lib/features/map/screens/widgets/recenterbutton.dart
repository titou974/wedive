import 'package:Wedive/common/controllers/localisation_controller.dart';
import 'package:Wedive/features/map/controllers/map_controller.dart';
import 'package:Wedive/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class RecenterButton extends StatelessWidget {
  const RecenterButton({
    super.key,
    // required this.mapboxController,
    required this.localisationController,
  });
  // final MapController mapboxController;
  final LocalisationController localisationController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: WediveSizes.md,
      bottom: 280,
      child: ElevatedButton(
        onPressed: () => {},
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          minimumSize: const Size(36, 36),
          backgroundColor: Theme.of(
            context,
          ).colorScheme.onSecondary, // Button color
          foregroundColor: Theme.of(
            context,
          ).colorScheme.secondary, // Icon color
        ),
        child: Icon(Icons.my_location),
      ),
    );
  }
}
