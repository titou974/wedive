import 'package:Wedive/common/controllers/localisation_controller.dart';
import 'package:Wedive/common/widgets/map/cluster_marker.dart';
import 'package:Wedive/features/map/controllers/animation_controller.dart';
import 'package:Wedive/features/map/screens/widgets/animatedusermarker.dart';
import 'package:Wedive/utils/constants/map.dart';
import 'package:Wedive/utils/constants/sizes.dart';
import 'package:Wedive/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_map/flutter_map.dart' as fm;
import 'package:flutter_map_animations/flutter_map_animations.dart'
    as fm_animation;
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart'
    as fm_cluster;
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
    duration: const Duration(
      milliseconds: FlutterMapConstants.mapTransitionDuration,
    ),
    curve: FlutterMapConstants.mapTransitionCurve,
    cancelPreviousAnimations: FlutterMapConstants.cancelPreviousMapAnimations,
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
        initialCenter: LatLng(
          pos?.latitude ?? FlutterMapConstants.defaultLatitude,
          pos?.longitude ?? FlutterMapConstants.defaultLongitude,
        ),
        minZoom: FlutterMapConstants.minZoomLevel,
        maxZoom: FlutterMapConstants.maxZoomLevel,
      ),
      mapController: flutterMapController.mapController,
      children: [
        fm.TileLayer(
          urlTemplate: dark
              ? FlutterMapConstants.darkMapTheme.replaceFirst(
                  "{accessToken}",
                  accessToken,
                )
              : FlutterMapConstants.lightMapTheme.replaceFirst(
                  "{accessToken}",
                  accessToken,
                ),
          additionalOptions: {'accessToken': accessToken},
        ),
        fm_cluster.MarkerClusterLayerWidget(
          options: fm_cluster.MarkerClusterLayerOptions(
            maxClusterRadius: FlutterMapConstants.maxClusterRadius,
            showPolygon: FlutterMapConstants.showPolygon,
            size: const Size(
              FlutterMapConstants.defaultClusterMarkerSize,
              FlutterMapConstants.defaultClusterMarkerSize,
            ),
            markers: widget.markerList,
            padding: const EdgeInsets.all(WediveSizes.spaceBtwItems),
            builder: (context, clusterMarkers) {
              return ClusterMarker(length: clusterMarkers.length);
            },
          ),
        ),

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
