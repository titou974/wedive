import 'package:Wedive/features/map/controllers/map_controller.dart';
import 'package:Wedive/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class Map extends StatelessWidget {
  const Map({super.key, required this.mapboxController});

  final MapController mapboxController;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final dark = WeDiveHelperFunctions.isDarkMode(context);
        return MapWidget(
          key: ValueKey(dark),
          styleUri: dark
              ? "mapbox://styles/titou97410/cmgj08od800o401sb8psfbo2j"
              : "mapbox://styles/titou97410/cmgen9jaa00gb01qw7tld6aq5",
          onMapCreated: mapboxController.onMapCreated,
        );
      },
    );
  }
}
