import 'package:Wedive/common/widgets/appbar/appbar.dart';
import 'package:Wedive/common/widgets/avatar/avatar.dart';
import 'package:Wedive/common/widgets/logo/logo.dart';
import 'package:Wedive/utils/constants/image_strings.dart';
import 'package:Wedive/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class WeDiveTopBar extends StatelessWidget {
  final String imageUserUrl;
  final String? cityName;

  const WeDiveTopBar({
    super.key,
    this.imageUserUrl = WediveImages.profilePictureUser,
    this.cityName,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          IgnorePointer(
            ignoring: true,
            child: WediveAppBar(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppLogo(isInAppBar: true, little: true),
                  SizedBox(height: WediveSizes.sm),
                  // display city name only when provided
                  if (cityName != null && cityName!.isNotEmpty)
                    Text(
                      cityName!,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: Theme.of(
                          context,
                        ).colorScheme.secondary,
                      ),
                    ),
                ],
              ),
              actions: [],
            ),
          ),
          // Place the avatar button separately and position it
          Positioned(top: 0, right: 0, child: Avatar(imageUrl: imageUserUrl)),
        ],
      ),
    );
  }
}
