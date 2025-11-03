// features/map/screens/map_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Wedive/utils/constants/image_strings.dart';
import 'package:Wedive/utils/constants/lists.dart';
import 'package:Wedive/features/map/screens/widgets/map.dart';
import 'package:Wedive/common/controllers/localisation_controller.dart';
import 'package:Wedive/features/map/controllers/map_controller.dart'
    as app_map_ctrl;
import 'package:Wedive/features/map/controllers/animation_controller.dart';
import 'package:Wedive/features/map/controllers/marker_controller.dart';
import 'package:Wedive/features/map/screens/widgets/infinitycarousel.dart';
import 'package:Wedive/features/map/screens/widgets/recenterbutton.dart';
import 'package:Wedive/common/widgets/appbar/topbar.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final markerController = Get.put(MarkerController());
  final localisationController = Get.put(LocalisationController());
  final mapController = Get.put(app_map_ctrl.MapController());
  final animationController = Get.put(UserMarkerAnimationController());
  @override
  void initState() {
    super.initState();
    // Load spots into marker controller
    markerController.loadSpots(spots);
    // ensure we request permission and start the position stream for the map
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final granted = await localisationController.requestLocationAndProceed(
        navigateOnSuccess: false,
      );
      if (granted) {
        await localisationController.startPositionStream();
      } else {
        // permission/service not available — UI will show messages on the localisation page
      }
    });
  }

  @override
  void dispose() {
    localisationController.userPositionStream?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Map(
            mapController: mapController,
            localisationController: localisationController,
            animationController: animationController,
            markerList: markerController.markerList,
          ),
          Obx(() {
            final city = localisationController.cityName;
            final country = localisationController.countryName;
            return WeDiveTopBar(
              cityName: '$city, $country',
              imageUserUrl: WediveImages.profilePictureUser,
            );
          }),
          InfinityCarousel(spots: spots),
          RecenterButton(localisationController: localisationController),
        ],
      ),
    );
  }
}
