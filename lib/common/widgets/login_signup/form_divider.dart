import 'package:Wedive/utils/constants/colors.dart';
import 'package:Wedive/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class FormDivider extends StatelessWidget {
  const FormDivider({super.key, required this.orSignInWith});
  final String orSignInWith;
  @override
  Widget build(BuildContext context) {
    final dark = WeDiveHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: dark
                ? WediveColorsTheme.textLightGrey
                : WediveColorsTheme.textLightGrey,
            thickness: 0.5,
            indent: 30,
            endIndent: 5,
          ),
        ),
        Text(orSignInWith, style: Theme.of(context).textTheme.labelMedium),
        Flexible(
          child: Divider(
            color: dark
                ? WediveColorsTheme.textLightGrey
                : WediveColorsTheme.textLightGrey,
            thickness: 0.5,
            indent: 5,
            endIndent: 30,
          ),
        ),
      ],
    );
  }
}
