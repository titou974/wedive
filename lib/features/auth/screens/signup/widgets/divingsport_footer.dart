import 'package:Wedive/features/auth/controllers/signup_controller.dart';
import 'package:Wedive/utils/constants/fr_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DivingSportFooter extends StatelessWidget {
  const DivingSportFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final signupController = Get.find<SignUpController>();

    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              signupController.pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            },
            child: const Text(WediveTextsFr.next),
          ),
        ),
      ],
    );
  }
}
