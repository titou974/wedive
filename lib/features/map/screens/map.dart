import 'package:Wedive/common/widgets/appbar/appbar.dart';
import 'package:Wedive/common/widgets/avatar/avatar.dart';
import 'package:Wedive/features/map/controllers/map_controller.dart';
import 'package:Wedive/features/map/screens/widgets/infinitycarousel.dart';
import 'package:Wedive/utils/constants/image_strings.dart';
import 'package:Wedive/utils/constants/mapbox.dart';
import 'package:Wedive/utils/constants/sizes.dart';
import 'package:Wedive/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:Wedive/common/widgets/logo/logo.dart';
import 'package:Wedive/utils/constants/fr_strings.dart';
import 'package:Wedive/utils/constants/lists.dart';
import 'package:get/get.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  MapboxMap? mapboxMapController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Builder(
            builder: (context) {
              final dark = WeDiveHelperFunctions.isDarkMode(context);
              return MapWidget(
                key: ValueKey(dark), // <-- Key changes when theme changes
                styleUri: dark
                    ? "mapbox://styles/titou97410/cmgj08od800o401sb8psfbo2j"
                    : "mapbox://styles/titou97410/cmgen9jaa00gb01qw7tld6aq5",
                onMapCreated: onMapCreated,
              );
            },
          ),
          SafeArea(
            child: Stack(
              children: [
                IgnorePointer(
                  ignoring: true,
                  child: WediveAppBar(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLogo(isInAppBar: true, little: true),
                        SizedBox(height: WediveSizes.sm),
                        Text(
                          WediveTextsFr.cityTest,
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(
                                decoration: TextDecoration.underline,
                                decorationColor: Theme.of(
                                  context,
                                ).colorScheme.secondary,
                              ),
                        ),
                      ],
                    ),
                    actions: [],
                  ),
                ),
                // Place the avatar button separately and position it
                Positioned(
                  top: 0,
                  right: 0,
                  child: Avatar(imageUrl: WediveImages.profilePictureUser),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: WediveSizes.spaceBtwSections,
            child: InfinityCarousel(spots: spots),
          ),
        ],
      ),
    );
  }

  void onMapCreated(MapboxMap mapboxMap) {
    setState(() {
      mapboxMapController = mapboxMap;
    });
    // Disable the scale bar
    mapboxMap.scaleBar.updateSettings(ScaleBarSettings(enabled: false));
    // Update the location of the user
    mapboxMap.location.updateSettings(LocationComponentSettings(enabled: true));
  }
}
