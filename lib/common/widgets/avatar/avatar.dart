import 'package:Wedive/utils/constants/sizes.dart';
import 'package:Wedive/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String imageUrl;

  const Avatar({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: WediveSizes.defaultSpace),
      child: IconButton(
        onPressed: () {
          // Handle avatar button tap
        },
        icon: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: WediveColorsTheme.secondaryBlue, // Accent blue border
              width: 2,
            ),
          ),
          child: CircleAvatar(
            radius: 16,
            backgroundImage: AssetImage(imageUrl),
          ),
        ),
      ),
    );
  }
}
