import 'package:Wedive/utils/constants/fr_strings.dart';
import 'package:Wedive/utils/constants/sizes.dart';
import 'package:Wedive/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final bool isInAppBar;
  final bool little;
  const AppLogo({super.key, this.isInAppBar = false, this.little = false});

  @override
  Widget build(BuildContext context) {
    // change the size of the logo based on the little parameter
    // if little is true, use a smaller font size
    // if little is false, use a larger font size

    if (little) {
      return Positioned(
        top: WeDiveUtils.getAppBarHeight() + 10,
        left: WediveSizes.defaultSpace,
        child: Text(
          WediveTextsFr.appName,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      );
    }

    final logo = Text(
      WediveTextsFr.appName,
      style: Theme.of(context).textTheme.headlineMedium,
    );

    if (isInAppBar) {
      return logo;
    }

    return Positioned(
      top: WeDiveUtils.getAppBarHeight(),
      left: WediveSizes.defaultSpace,
      child: logo,
    );
  }
}
