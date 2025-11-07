import 'package:Wedive/utils/constants/image_strings.dart';
import 'package:Wedive/utils/constants/sizes.dart';
import 'package:Wedive/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LocalisationPage extends StatelessWidget {
  const LocalisationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: WediveSizes.spaceBtwSections),
        Lottie.asset(
          WediveImages.localisation,
          width: WeDiveHelperFunctions.screenWidth(),
          height: WeDiveHelperFunctions.screenHeight() * 0.3,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
