import 'package:Wedive/common/controllers/localisation_controller.dart';
import 'package:Wedive/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_map/flutter_map.dart' as fm;
import 'package:latlong2/latlong.dart';

// bind to your app MapController (avoid name clash with flutter_map.MapController)
import 'package:Wedive/features/map/controllers/map_controller.dart'
    as app_map_ctrl;

class Map extends StatefulWidget {
  const Map({
    super.key,
    required this.appMapController,
    required this.localisationController,
  });
  final app_map_ctrl.MapController appMapController;
  final LocalisationController localisationController;

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  String get accessToken => dotenv.env['MAPBOX_ACCESS_TOKEN'] ?? '';
  final flutterMapController = fm.MapController();

  @override
  Widget build(BuildContext context) {
    final dark = WeDiveHelperFunctions.isDarkMode(context);
    final pos = widget.localisationController.currentPosition.value;
    return fm.FlutterMap(
      options: fm.MapOptions(
        onMapReady: () {
          widget.appMapController.bindFlutterMapController(
            flutterMapController,
          );
        },
        initialCenter: LatLng(pos?.latitude ?? 0.0, pos?.longitude ?? 0.0),
        minZoom: 3,
        maxZoom: 18,
      ),
      mapController: flutterMapController,
      children: [
        fm.TileLayer(
          urlTemplate: dark
              ? "https://api.mapbox.com/styles/v1/titou97410/cmgj08od800o401sb8psfbo2j/tiles/256/{z}/{x}/{y}@2x?access_token={accessToken}"
              : "https://api.mapbox.com/styles/v1/titou97410/cmgen9jaa00gb01qw7tld6aq5/tiles/256/{z}/{x}/{y}@2x?access_token={accessToken}",
          additionalOptions: {'accessToken': accessToken},
        ),
      ],
    );
  }
}
