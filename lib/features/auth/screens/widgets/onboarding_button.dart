import 'package:Wedive/features/auth/controllers/onboarding_controller.dart';
import 'package:Wedive/utils/constants/sizes.dart';
import 'package:Wedive/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CircleArrowButton extends StatelessWidget {
  const CircleArrowButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;

    return Positioned(
      right: WediveSizes.defaultSpace,
      bottom: WeDiveUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => controller.nextPage(),
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          minimumSize: const Size(56, 56),
        ),
        child: const Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}
