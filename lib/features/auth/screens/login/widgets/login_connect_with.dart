import 'package:Wedive/utils/constants/colors.dart';
import 'package:Wedive/utils/constants/fr_strings.dart';
import 'package:flutter/material.dart';

class OrConnectWith extends StatelessWidget {
  const OrConnectWith({super.key, required this.dark});

  final bool dark;

  @override
  Widget build(BuildContext context) {
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
        Text(
          WediveTextsFr.orSignInWith,
          style: Theme.of(context).textTheme.labelMedium,
        ),
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
