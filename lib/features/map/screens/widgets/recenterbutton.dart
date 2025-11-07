import 'package:Wedive/features/map/controllers/map_controller.dart';
import 'package:Wedive/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecenterButton extends StatelessWidget {
  const RecenterButton({super.key});

  @override
  Widget build(BuildContext context) {
    final mapController = Get.find<MapController>();
    return Positioned(
      right: WediveSizes.md,
      bottom: 280,
      child: ElevatedButton(
        onPressed: () => {mapController.recenterToUser()},
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
