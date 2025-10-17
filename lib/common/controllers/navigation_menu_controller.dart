import 'package:Wedive/features/feed/screens/feed.dart';
import 'package:Wedive/features/map/screens/map.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    MapScreen(),
    LocationExample(),
    Container(color: Colors.blue),
  ];
}
