import 'package:Wedive/common/styles/spacing_styles.dart';
import 'package:Wedive/features/auth/screens/login/widgets/login_connect_with.dart';
import 'package:Wedive/features/auth/screens/login/widgets/login_form.dart';
import 'package:Wedive/features/auth/screens/login/widgets/login_header.dart';
import 'package:Wedive/features/auth/screens/login/widgets/login_other.dart';
import 'package:Wedive/features/auth/screens/onboarding/widgets/onboarding_logo.dart';
import 'package:Wedive/utils/constants/sizes.dart';
import 'package:Wedive/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = WeDiveHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: Stack(
        children: [
          AppLogo(),
          SingleChildScrollView(
            child: Padding(
              padding: WeDiveSpacingStyles.paddingWithAppBarHeight,
              child: Column(
                children: [
                  const SizedBox(
                    height:
                        WediveSizes.spaceBtwSections +
                        WediveSizes.spaceBtwSections,
                  ),
                  LoginHeader(),
                  LoginForm(),
                  OrConnectWith(dark: dark),
                  const SizedBox(height: WediveSizes.spaceBtwSections),
                  OtherLogin(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
