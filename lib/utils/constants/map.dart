// CameraOptions camera = CameraOptions(
//   center: Point(coordinates: Position(55.536384, -21.115141)),
//   zoom: 9.5,
//   bearing: 0,
//   pitch: 0,
// );

import 'package:flutter/material.dart';

class FlutterMapConstants {
  static const double defaultZoomLevel = 11.0;
  static const double minZoomLevel = 2.0;
  static const double maxZoomLevel = 18.0;
  static const double defaultLatitude = 0.0;
  static const double defaultLongitude = 0.0;
  static const lightMapTheme =
      "https://api.mapbox.com/styles/v1/titou97410/cmgen9jaa00gb01qw7tld6aq5/tiles/256/{z}/{x}/{y}@2x?access_token={accessToken}";
  static const darkMapTheme =
      "https://api.mapbox.com/styles/v1/titou97410/cmgj08od800o401sb8psfbo2j/tiles/256/{z}/{x}/{y}@2x?access_token={accessToken}";
  static const int mapTransitionDuration = 1000;
  static const Curve mapTransitionCurve = Curves.easeOut;
  static const bool cancelPreviousMapAnimations = true;

  // Marker constants
  static const double defaultMarkerSize = 60.0;
  static const double topMarkerOffset = 0.06;
  static const double avatarRadiusFactor = 0.74;

  // userMarker constants
  static const int duration = 5000;
  static const double animationWeight = 50.0;

  // infinity carousel constants
  static const double carouselHeight = 240.0;
  static const double carouselExtent = 160.0;
  static const int carouselZoomDuration = 500;
  static const int carouselBorderColorDuration = 300;
  static const double animatedImageScale = 1.1;
}
