import 'package:Wedive/features/feed/screens/map/map.dart';
import 'package:Wedive/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations: [
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/map.svg',
                width: 28,
                height: 28,
                colorFilter: ColorFilter.mode(
                  controller.selectedIndex.value == 0
                      ? WediveColorsTheme.accentBlue
                      : WediveColorsTheme.textBlack,
                  BlendMode.srcIn,
                ),
              ),
              label: '',
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/startsession.svg',
                width: 40,
                height: 40,
                colorFilter: ColorFilter.mode(
                  controller.selectedIndex.value == 1
                      ? WediveColorsTheme.accentBlue
                      : WediveColorsTheme.textBlack,
                  BlendMode.srcIn,
                ),
              ),
              label: '',
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/scubadiving.svg',
                width: 28,
                height: 28,
                colorFilter: ColorFilter.mode(
                  controller.selectedIndex.value == 2
                      ? WediveColorsTheme.accentBlue
                      : WediveColorsTheme.textBlack,
                  BlendMode.srcIn,
                ),
              ),
              label: '',
            ),
          ],
          backgroundColor: WediveColorsTheme.backgroundWhite,
          indicatorColor: Colors.transparent,
          shadowColor: WediveColorsTheme.secondaryBlue,
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    MapScreen(),
    Container(color: Colors.blueGrey),
    Container(color: Colors.blue),
  ];
}
