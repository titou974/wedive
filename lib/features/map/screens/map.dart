import 'package:Wedive/common/controllers/localisation_controller.dart';
import 'package:Wedive/common/widgets/appbar/topbar.dart';
import 'package:Wedive/features/map/controllers/map_controller.dart';
import 'package:Wedive/features/map/screens/widgets/infinitycarousel.dart';
import 'package:Wedive/features/map/screens/widgets/recenterbutton.dart';
import 'package:Wedive/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:geolocator/geolocator.dart';
import 'package:Wedive/utils/constants/lists.dart';
import 'package:Wedive/features/map/screens/widgets/map.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final mapboxController = Get.put(MapController());
  final localisationController = Get.put(LocalisationController());

  @override
  void initState() {
    super.initState();
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
          Map(mapboxController: mapboxController),
          WeDiveTopBar(
            cityName: "Saint Gilles Les Bains, Réunion",
            imageUserUrl: WediveImages.profilePictureUser,
          ),
          InfinityCarousel(spots: spots),
          RecenterButton(
            mapboxController: mapboxController,
            localisationController: localisationController,
          ),
          // Center-on-user button
        ],
      ),
    );
  }
}
