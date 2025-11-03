import 'package:Wedive/common/controllers/localisation_controller.dart';
import 'package:Wedive/features/map/controllers/animation_controller.dart';
import 'package:Wedive/features/map/screens/widgets/animatedusermarker.dart';
import 'package:Wedive/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_map/flutter_map.dart' as fm;
import 'package:flutter_map_animations/flutter_map_animations.dart'
    as fm_animation;
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:Wedive/features/map/controllers/map_controller.dart'
    as map_controller;

class Map extends StatefulWidget {
  const Map({
    super.key,
    required this.mapController,
    required this.localisationController,
    required this.animationController,
    required this.markerList,
  });
  final map_controller.MapController mapController;
  final LocalisationController localisationController;
  final UserMarkerAnimationController animationController;
  final RxList<fm.Marker> markerList;

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> with TickerProviderStateMixin {
  String get accessToken => dotenv.env['MAPBOX_ACCESS_TOKEN'] ?? '';
  late final flutterMapController = fm_animation.AnimatedMapController(
    vsync: this,
    duration: const Duration(milliseconds: 1000),
    curve: Curves.easeOut,
    cancelPreviousAnimations: true,
  );

  @override
  void initState() {
    super.initState();
    // Démarrer l'animation au chargement
    widget.animationController.startAnimation();
  }

  @override
  void dispose() {
    // Optionnel : arrêter l'animation et nettoyer
    // Get.delete<UserMarkerAnimationController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dark = WeDiveHelperFunctions.isDarkMode(context);
    final pos = widget.localisationController.currentPosition.value;
    return fm.FlutterMap(
      options: fm.MapOptions(
        onMapReady: () {
          widget.mapController.bindFlutterMapController(flutterMapController);
        },
        initialCenter: LatLng(pos?.latitude ?? 0.0, pos?.longitude ?? 0.0),
        minZoom: 3,
        maxZoom: 18,
      ),
      mapController: flutterMapController.mapController,
      children: [
        fm.TileLayer(
          urlTemplate: dark
              ? "https://api.mapbox.com/styles/v1/titou97410/cmgj08od800o401sb8psfbo2j/tiles/256/{z}/{x}/{y}@2x?access_token={accessToken}"
              : "https://api.mapbox.com/styles/v1/titou97410/cmgen9jaa00gb01qw7tld6aq5/tiles/256/{z}/{x}/{y}@2x?access_token={accessToken}",
          additionalOptions: {'accessToken': accessToken},
        ),
        // reactive marker layer — rebuild when markerList changes
        Obx(() {
          final markers = widget.markerList.toList();
          return fm.MarkerLayer(markers: markers);
        }),
        Obx(() {
          final pos = widget.localisationController.currentPosition.value;
          if (pos == null) return const SizedBox.shrink();

          return AnimatedUserMarker(
            position: LatLng(pos.latitude, pos.longitude),
            primaryColor: Theme.of(context).colorScheme.primary,
            borderColor: Theme.of(context).colorScheme.onPrimary,
          );
        }),
      ],
    );
  }
}
