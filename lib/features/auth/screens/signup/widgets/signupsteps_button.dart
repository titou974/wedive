import 'package:Wedive/features/auth/controllers/signup_controller.dart';
import 'package:Wedive/utils/constants/fr_strings.dart';
import 'package:Wedive/utils/constants/sizes.dart';
import 'package:Wedive/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';

class SignupContinueButton extends StatelessWidget {
  const SignupContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignUpController.instance;

    return Positioned(
      right: WediveSizes.defaultSpace,
      bottom: WeDiveUtils.getBottomNavigationBarHeight(),
      child: Obx(() {
        final isFirstPage = controller.currentPageIndex.value == 0;
        final canContinue =
            !isFirstPage || controller.selectedSports.isNotEmpty;
        return ElevatedButton(
          onPressed: canContinue ? () => controller.nextPage() : null,
          style: ElevatedButton.styleFrom(minimumSize: const Size(56, 56)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(WediveTextsFr.next),
              const SizedBox(width: 8),
              const Icon(Iconsax.arrow_right_1, size: 20),
            ],
          ),
        );
      }),
    );
  }
}
