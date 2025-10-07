import 'package:Wedive/common/widgets/appbar/appbar.dart';
import 'package:Wedive/common/widgets/avatar/avatar.dart';
import 'package:Wedive/features/feed/screens/map/widgets/infinitycarousel.dart';
import 'package:Wedive/utils/constants/colors.dart';
import 'package:Wedive/utils/constants/image_strings.dart';
import 'package:Wedive/utils/constants/mapbox.dart';
import 'package:Wedive/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:Wedive/common/widgets/logo/logo.dart';
import 'package:Wedive/utils/constants/fr_strings.dart';
import 'package:Wedive/utils/constants/lists.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

void onMapCreated(MapboxMap mapboxMap) async {
  mapboxMap.scaleBar.updateSettings(ScaleBarSettings(enabled: false));
}

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Map fills the whole screen
          MapWidget(
            key: const ValueKey('main_map'),
            cameraOptions: camera,
            styleUri: "mapbox://styles/titou97410/cmgen9jaa00gb01qw7tld6aq5",
            onMapCreated: onMapCreated,
          ),

          // Transparent AppBar on top of the map
          SafeArea(
            child: IgnorePointer(
              child: WediveAppBar(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppLogo(isInAppBar: true, little: true),
                    SizedBox(height: WediveSizes.sm),
                    Text(
                      WediveTextsFr.cityTest,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: WediveColorsTheme.accentBlue,
                      ),
                    ),
                  ],
                ),
                actions: [
                  const Avatar(imageUrl: WediveImages.profilePictureUser),
                ],
              ),
            ),
          ),
          // Carousel positioned at the bottom, above the nav bar
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
}
