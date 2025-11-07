import 'package:Wedive/features/auth/controllers/signup_controller.dart';
import 'package:Wedive/utils/constants/sizes.dart';
import 'package:Wedive/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SignupStepsDots extends StatelessWidget {
  const SignupStepsDots({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignUpController.instance;

    return Positioned(
      top: WeDiveUtils.getAppBarHeight() + 25,
      left: WediveSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 2,
        effect: WormEffect(
          activeDotColor: Theme.of(context).colorScheme.primary,
          dotHeight: 10,
          dotWidth: 10,
          spacing: 4.0,
        ),
      ),
    );
  }
}
