// features/map/screens/map_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Wedive/utils/constants/image_strings.dart';
import 'package:Wedive/utils/constants/lists.dart';
import 'package:Wedive/features/map/screens/widgets/map.dart';
import 'package:Wedive/common/controllers/localisation_controller.dart';
import 'package:Wedive/features/map/screens/widgets/infinitycarousel.dart';
import 'package:Wedive/features/map/screens/widgets/recenterbutton.dart';
import 'package:Wedive/common/widgets/appbar/topbar.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localisationController = Get.find<LocalisationController>();

    return Scaffold(
      body: Stack(
        children: [
          Map(),
          Obx(() {
            final city = localisationController.cityName;
            final country = localisationController.countryName;
            return WeDiveTopBar(
              cityName: '$city, $country',
              imageUserUrl: WediveImages.profilePictureUser,
            );
          }),
          InfinityCarousel(spots: wediveSpotsExemples),
          RecenterButton(),
        ],
      ),
    );
  }
}
