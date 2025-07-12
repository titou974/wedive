import 'package:Wedive/utils/constants/colors.dart';
import 'package:Wedive/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OtherLogin extends StatelessWidget {
  const OtherLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: WediveColorsTheme.textLightGrey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/google.svg',
              width: WediveSizes.iconMd,
              height: WediveSizes.iconMd,
            ),
          ),
        ),
        const SizedBox(width: WediveSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: WediveColorsTheme.textLightGrey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/apple.svg',
              width: WediveSizes.iconMd,
              height: WediveSizes.iconMd,
            ),
          ),
        ),
      ],
    );
  }
}
