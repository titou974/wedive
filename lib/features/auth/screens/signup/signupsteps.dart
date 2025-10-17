import 'package:Wedive/features/auth/controllers/sign_up_controller.dart';
import 'package:Wedive/features/auth/screens/signup/widgets/divingsport.dart';
import 'package:Wedive/features/auth/screens/signup/widgets/localisation.dart';
import 'package:Wedive/features/auth/screens/signup/widgets/signupsteps_dots.dart';
import 'package:Wedive/features/auth/screens/signup/widgets/signupstepspage.dart';
import 'package:Wedive/utils/constants/fr_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      body: PageView(
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
            // footer: continue to next page
            footerWidget: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      controller.pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                    child: const Text('Continuer'),
                  ),
                ),
              ],
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
            // footer: request location & proceed (controller handles navigation if configured)
            footerWidget: Row(
              children: [
                Expanded(
                  child: Obx(() {
                    final loading = controller.isRequestingLocation.value;
                    return ElevatedButton(
                      onPressed: loading
                          ? null
                          : () => controller.requestLocationAndProceed(
                              context: context,
                            ),
                      child: loading
                          ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text('Autoriser et continuer'),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
