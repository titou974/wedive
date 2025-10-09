import 'package:Wedive/features/map/screens/map.dart';
import 'package:Wedive/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

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
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.surface,
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
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.surface,
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
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.surface,
                  BlendMode.srcIn,
                ),
              ),
              label: '',
            ),
          ],
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
