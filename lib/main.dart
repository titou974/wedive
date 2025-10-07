import 'package:flutter/material.dart';
import 'package:Wedive/app.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: ".env");

  WidgetsFlutterBinding.ensureInitialized();

  String accessToken = dotenv.env['MAPBOX_ACCESS_TOKEN'] ?? "";

  MapboxOptions.setAccessToken(accessToken);

  runApp(const App());
}
