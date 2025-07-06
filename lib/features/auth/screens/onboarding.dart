import 'package:Wedive/features/auth/screens/widgets/onboarding_dots.dart';
import 'package:Wedive/features/auth/screens/widgets/onboarding_logo.dart';
import 'package:Wedive/features/auth/screens/widgets/onboarding_page.dart';
import 'package:Wedive/features/auth/screens/widgets/onboarding_skip.dart';
import 'package:Wedive/utils/constants/fr_strings.dart';
import 'package:Wedive/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: [
              OnBoardingPage(
                image: WediveImages.bottleDiverWoman,
                title: WediveTextsFr.onboardingTitle1,
                subtitle: WediveTextsFr.onboardingSubtitle1,
              ),
              OnBoardingPage(
                image: WediveImages.kayakCouple,
                title: WediveTextsFr.onboardingTitle2,
                subtitle: WediveTextsFr.onboardingSubtitle2,
              ),
              OnBoardingPage(
                image: WediveImages.seaPollution,
                title: WediveTextsFr.onboardingTitle3,
                subtitle: WediveTextsFr.onboardingSubtitle3,
              ),
            ],
          ),
          AppLogo(),
          OnBoardingSkip(),
          OnBoardingDots(),
        ],
      ),
    );
  }
}
