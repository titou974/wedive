import 'package:Wedive/utils/constants/sizes.dart';
import 'package:Wedive/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class WediveAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget>? actions;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final VoidCallback? leadingOnPressed;

  const WediveAppBar({
    super.key,
    required this.title,
    this.actions,
    this.showBackArrow = false,
    this.leadingIcon,
    this.leadingOnPressed,
  });

  @override
  Size get preferredSize => Size.fromHeight(WeDiveUtils.getAppBarHeight());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: WediveSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(
                icon: Icon(Iconsax.arrow_left),
                onPressed: () => Get.back(),
              )
            : leadingIcon != null
            ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon))
            : null,
        title: title,
        actions: actions,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
