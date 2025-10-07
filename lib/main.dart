import 'package:flutter/material.dart';
import 'package:Wedive/app.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Pass your access token to MapboxOptions so you can load a map
  String accessToken = const String.fromEnvironment("ACCESS_TOKEN");
  MapboxOptions.setAccessToken(accessToken);

  // Define options for your camera

  runApp(const App());
}
