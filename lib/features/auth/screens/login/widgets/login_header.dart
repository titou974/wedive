import 'package:Wedive/utils/constants/fr_strings.dart';
import 'package:Wedive/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          WediveTextsFr.loginTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: WediveSizes.sm),
        Text(
          WediveTextsFr.loginSubtitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
