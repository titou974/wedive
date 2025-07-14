import 'package:Wedive/common/styles/spacing_styles.dart';
import 'package:Wedive/common/widgets/login_signup/form_divider.dart';
import 'package:Wedive/common/widgets/login_signup/social_buttons.dart';
import 'package:Wedive/common/widgets/logo/logo.dart';
import 'package:Wedive/features/auth/screens/login/widgets/login_form.dart';
import 'package:Wedive/features/auth/screens/login/widgets/login_header.dart';
import 'package:Wedive/utils/constants/fr_strings.dart';
import 'package:Wedive/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  FormDivider(orSignInWith: WediveTextsFr.orSignInWith),
                  const SizedBox(height: WediveSizes.spaceBtwSections),
                  SocialButtons(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
