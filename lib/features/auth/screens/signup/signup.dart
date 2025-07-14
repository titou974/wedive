import 'package:Wedive/common/widgets/login_signup/form_divider.dart';
import 'package:Wedive/common/widgets/login_signup/social_buttons.dart';
import 'package:Wedive/features/auth/screens/signup/widgets/signup_form.dart';
import 'package:Wedive/utils/constants/fr_strings.dart';
import 'package:Wedive/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(WediveSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                WediveTextsFr.signUpTitle,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: WediveSizes.spaceBtwSections),
              SignupForm(),
              SizedBox(height: WediveSizes.spaceBtwSections),
              FormDivider(orSignInWith: WediveTextsFr.orSignInWith),
              SizedBox(height: WediveSizes.spaceBtwSections),
              SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
