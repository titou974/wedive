// lib/routes/app_pages.dart
import 'package:Wedive/features/auth/screens/signup/signupsteps.dart';
import 'package:get/get.dart';
import 'package:Wedive/features/auth/screens/onboarding/onboarding.dart';
import 'package:Wedive/features/auth/screens/signup/signup.dart';
import 'package:Wedive/navigation_menu.dart';
import 'package:Wedive/features/auth/bindings/onboarding_binding.dart';
import 'package:Wedive/features/auth/bindings/signup_binding.dart';
import 'package:Wedive/common/bindings/navigation_binding.dart';

import 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.onboarding;

  static final routes = [
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnBoardingScreen(),
      binding: OnBoardingBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => const SignupScreen(),
      binding: SignUpBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.signupSteps,
      page: () => const SignupSteps(),
      binding: SignUpBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const NavigationMenu(),
      binding: NavigationBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
