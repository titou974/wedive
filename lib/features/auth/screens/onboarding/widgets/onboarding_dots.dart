import 'package:Wedive/features/auth/controllers/onboarding_controller.dart';
import 'package:Wedive/utils/constants/colors.dart';
import 'package:Wedive/utils/constants/sizes.dart';
import 'package:Wedive/utils/device/device_utility.dart';
import 'package:Wedive/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDots extends StatelessWidget {
  const OnBoardingDots({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = WeDiveHelperFunctions.isDarkMode(context);
    final controller = OnBoardingController.instance;

    return Positioned(
      bottom: WeDiveUtils.getBottomNavigationBarHeight() + 25,
      left: WediveSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect: ExpandingDotsEffect(
          activeDotColor: dark
              ? WediveColorsTheme.secondaryBlue
              : WediveColorsTheme.primaryBlue,
          dotHeight: 6,
        ),
      ),
    );
  }
}
