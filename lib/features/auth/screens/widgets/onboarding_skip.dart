import 'package:Wedive/features/auth/controllers/onboarding_controller.dart';
import 'package:Wedive/utils/constants/fr_strings.dart';
import 'package:Wedive/utils/constants/sizes.dart';
import 'package:Wedive/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;

    return Positioned(
      top: WeDiveUtils.getAppBarHeight(),
      right: WediveSizes.defaultSpace,
      child: TextButton(
        onPressed: () => controller.skipPage(),
        child: Text(
          WediveTextsFr.skip,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
