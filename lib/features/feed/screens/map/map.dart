import 'package:Wedive/common/widgets/appbar/appbar.dart';
import 'package:Wedive/common/widgets/avatar/avatar.dart';
import 'package:Wedive/utils/constants/colors.dart';
import 'package:Wedive/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:Wedive/common/widgets/logo/logo.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            WediveAppBar(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppLogo(isInAppBar: true, little: true),
                  SizedBox(height: WediveSizes.sm),
                  Text(
                    'Saint-Gilles les Bains, France',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: WediveColorsTheme.accentBlue,
                    ),
                  ),
                ],
              ),
              actions: [const Avatar(imageUrl: 'assets/images/yo.jpg')],
            ),
          ],
        ),
      ),
    );
  }
}
