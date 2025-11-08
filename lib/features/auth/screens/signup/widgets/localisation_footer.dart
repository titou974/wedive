import 'package:Wedive/common/controllers/localisation_controller.dart';
import 'package:Wedive/utils/constants/fr_strings.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocalisationFooter extends StatelessWidget {
  const LocalisationFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final localisationController = Get.find<LocalisationController>();

      final loading = localisationController.isRequestingLocation.value;
      final permission = localisationController.locationPermission.value;
      final serviceEnabled =
          localisationController.locationServiceEnabled.value;

      String buttonText = WediveTextsFr.next;

      if (!serviceEnabled) {
        buttonText = WediveTextsFr.enableLocationServices;
      } else if (permission == LocationPermission.denied) {
        buttonText = WediveTextsFr.requestLocationPermission;
      } else if (permission == LocationPermission.deniedForever) {
        buttonText = WediveTextsFr.openAppSettings;
      }

      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
        ),
        onPressed: loading
            ? null
            : () => localisationController.requestLocationAndProceed(
                context: context,
                navigateOnSuccess: true,
              ),
        child: loading
            ? const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : Text(buttonText),
      );
    });
  }
}
