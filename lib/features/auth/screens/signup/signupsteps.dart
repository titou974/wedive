import 'package:Wedive/features/auth/screens/signup/widgets/divingsport.dart';
import 'package:Wedive/features/auth/screens/signup/widgets/signupsteps_dots.dart';
import 'package:Wedive/features/auth/screens/signup/widgets/signupstepspage.dart';
import 'package:Wedive/utils/constants/fr_strings.dart';
import 'package:Wedive/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SignupSteps extends StatelessWidget {
  const SignupSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: SignupStepsDots()),
      body: Stack(
        children: [
          PageView(
            children: [
              SignupStepsPage(
                title: WediveTextsFr.selectActivitiesTitle,
                subtitle: WediveTextsFr.selectActivitiesSubtitle,
                stepContent: DivingSportPage(
                  selectedSport: null,
                  onChanged: (value) {
                    // Handle sport selection change
                  },
                ),
              ),
              SignupStepsPage(
                title: WediveTextsFr.locationPermissionTitle,
                subtitle: WediveTextsFr.locationPermissionSubtitle,
                stepContent: Padding(
                  padding: EdgeInsets.all(WediveSizes.defaultSpace),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        WediveTextsFr.locationPermissionTitle,
                        style: Theme.of(context).textTheme.headlineMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: WediveSizes.spaceBtwItems),
                      Text(
                        WediveTextsFr.locationPermissionSubtitle,
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
