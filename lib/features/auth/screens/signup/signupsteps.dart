import 'package:Wedive/features/auth/controllers/signup_controller.dart';
import 'package:Wedive/features/auth/screens/signup/widgets/divingsport.dart';
import 'package:Wedive/features/auth/screens/signup/widgets/divingsport_footer.dart';
import 'package:Wedive/features/auth/screens/signup/widgets/localisation.dart';
import 'package:Wedive/features/auth/screens/signup/widgets/localisation_footer.dart';
import 'package:Wedive/features/auth/screens/signup/widgets/signupsteps_dots.dart';
import 'package:Wedive/features/auth/screens/signup/widgets/signupstepspage.dart';
import 'package:Wedive/utils/constants/fr_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupSteps extends StatelessWidget {
  const SignupSteps({super.key});

  @override
  Widget build(BuildContext context) {
    final signupController = Get.find<SignUpController>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SignupStepsDots(),
        automaticallyImplyLeading: false,
      ),
      body: PageView(
        controller: signupController.pageController,
        onPageChanged: signupController.updatePageIndicator,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SignupStepsPage(
            title: WediveTextsFr.selectActivitiesTitle,
            subtitle: WediveTextsFr.selectActivitiesSubtitle,
            stepContent: DivingSportPage(
              selectedSports: signupController.selectedSports,
            ),
            footerWidget: DivingSportFooter(),
          ),
          SignupStepsPage(
            title: WediveTextsFr.locationPermissionTitle,
            subtitle: WediveTextsFr.locationPermissionSubtitle,
            stepContent: LocalisationPage(),
            footerWidget: LocalisationFooter(),
          ),
        ],
      ),
    );
  }
}
