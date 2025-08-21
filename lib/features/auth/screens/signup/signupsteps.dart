import 'package:Wedive/features/auth/controllers/sign_up_controller.dart';
import 'package:Wedive/features/auth/screens/signup/widgets/divingsport.dart';
import 'package:Wedive/features/auth/screens/signup/widgets/localisation.dart';
import 'package:Wedive/features/auth/screens/signup/widgets/signupsteps_button.dart';
import 'package:Wedive/features/auth/screens/signup/widgets/signupsteps_dots.dart';
import 'package:Wedive/features/auth/screens/signup/widgets/signupstepspage.dart';
import 'package:Wedive/utils/constants/fr_strings.dart';
import 'package:Wedive/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class SignupSteps extends StatelessWidget {
  const SignupSteps({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SignupStepsDots(),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              SignupStepsPage(
                title: WediveTextsFr.selectActivitiesTitle,
                subtitle: WediveTextsFr.selectActivitiesSubtitle,
                stepContent: DivingSportPage(
                  selectedSports: controller.selectedSports,
                  onChanged: (sports) {
                    controller.updateSelectedSports(sports);
                  },
                ),
              ),
              SignupStepsPage(
                title: WediveTextsFr.locationPermissionTitle,
                subtitle: WediveTextsFr.locationPermissionSubtitle,
                stepContent: LocalisationPage(
                  location: controller.location,
                  onChanged: (value) {
                    controller.updateLocation(value);
                  },
                ),
              ),
            ],
          ),
          SignupContinueButton(),
        ],
      ),
    );
  }
}
