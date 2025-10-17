import 'package:Wedive/features/map/screens/map.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    MapScreen(),
    Container(color: Colors.green),
    Container(color: Colors.blue),
  ];
}
