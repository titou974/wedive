import 'package:flutter/material.dart';
import 'package:Wedive/app.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  String accessToken = dotenv.env['MAPBOX_ACCESS_TOKEN'] ?? "";
  MapboxOptions.setAccessToken(accessToken);
}

void main() async {
  await setup();
  runApp(const App());
}
