import 'package:Wedive/utils/constants/fr_strings.dart';
import 'package:Wedive/utils/constants/sizes.dart';
import 'package:Wedive/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: WeDiveUtils.getAppBarHeight(),
      right: WediveSizes.defaultSpace,
      child: TextButton(
        onPressed: () {},
        child: Text(
          WediveTextsFr.skip,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
