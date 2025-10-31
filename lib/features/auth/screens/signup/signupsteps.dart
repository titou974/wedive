import 'package:Wedive/common/controllers/localisation_controller.dart';
import 'package:Wedive/features/auth/controllers/sign_up_controller.dart';
import 'package:Wedive/features/auth/screens/signup/widgets/divingsport.dart';
import 'package:Wedive/features/auth/screens/signup/widgets/localisation.dart';
import 'package:Wedive/features/auth/screens/signup/widgets/signupsteps_dots.dart';
import 'package:Wedive/features/auth/screens/signup/widgets/signupstepspage.dart';
import 'package:Wedive/utils/constants/fr_strings.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class SignupSteps extends StatelessWidget {
  const SignupSteps({super.key});

  @override
  Widget build(BuildContext context) {
    final localisationController = Get.put(LocalisationController());
    final signupController = Get.put(SignUpController());
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
              onChanged: (sports) {
                signupController.updateSelectedSports(sports);
              },
            ),
            // footer: continue to next page
            footerWidget: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      signupController.pageController.nextPage(
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
            title:
                localisationController.locationPermission.value ==
                        LocationPermission.deniedForever ||
                    localisationController.locationPermission.value ==
                        LocationPermission.denied
                ? WediveTextsFr.locationPermissionDeniedTitle
                : WediveTextsFr.locationPermissionTitle,
            subtitle:
                localisationController.locationPermission.value ==
                    LocationPermission.deniedForever
                ? WediveTextsFr.locationPermissionSubtitleDeniedForever
                : localisationController.locationPermission.value ==
                      LocationPermission.denied
                ? WediveTextsFr.locationPermissionSubtitleDenied
                : WediveTextsFr.locationPermissionSubtitle,
            stepContent: LocalisationPage(
              location: localisationController.location,
            ),
            // footer: request location & proceed (controller handles navigation if configured)
            footerWidget: Row(
              children: [
                Expanded(
                  child: Obx(() {
                    final loading =
                        localisationController.isRequestingLocation.value;
                    return ElevatedButton(
                      onPressed: loading
                          ? null
                          : () => {
                              localisationController.requestLocationAndProceed(
                                context: context,
                              ),

                              if (localisationController
                                          .locationPermission
                                          .value ==
                                      LocationPermission.always ||
                                  localisationController
                                          .locationPermission
                                          .value ==
                                      LocationPermission.whileInUse)
                                {signupController.nextPage()},
                            },
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
