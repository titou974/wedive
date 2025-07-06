import 'package:Wedive/utils/constants/fr_strings.dart';
import 'package:Wedive/utils/constants/sizes.dart';
import 'package:Wedive/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: WeDiveUtils.getAppBarHeight(),
      left: WediveSizes.defaultSpace,
      child: Text(
        WediveTextsFr.appName,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
