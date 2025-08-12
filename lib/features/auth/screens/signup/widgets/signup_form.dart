import 'package:Wedive/features/auth/screens/signup/signupsteps.dart';
import 'package:Wedive/utils/constants/colors.dart';
import 'package:Wedive/utils/constants/fr_strings.dart';
import 'package:Wedive/utils/constants/sizes.dart';
import 'package:Wedive/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = WeDiveHelperFunctions.isDarkMode(context);
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: WediveTextsFr.usernameLabel,
              prefixIcon: Icon(Iconsax.user),
            ),
          ),
          SizedBox(height: WediveSizes.spaceBtwInputFields),
          TextFormField(
            decoration: InputDecoration(
              labelText: WediveTextsFr.emailLabel,
              prefixIcon: Icon(Iconsax.direct_right),
            ),
          ),
          SizedBox(height: WediveSizes.spaceBtwInputFields),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.password_check),
              labelText: WediveTextsFr.passwordLabel,
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          SizedBox(height: WediveSizes.spaceBtwInputFields),
          Row(
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: Checkbox(value: false, onChanged: (value) {}),
              ),
              const SizedBox(width: WediveSizes.spaceBtwItems),
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '${WediveTextsFr.iAgreeToTerms} ',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      TextSpan(
                        text: '${WediveTextsFr.termsOfService} ',
                        style: Theme.of(context).textTheme.labelMedium!.apply(
                          color: dark
                              ? WediveColorsTheme.textWhite
                              : WediveColorsTheme.primaryBlue,
                          decoration: TextDecoration.underline,
                          decorationColor: dark
                              ? WediveColorsTheme.textWhite
                              : WediveColorsTheme.primaryBlue,
                        ),
                      ),
                      TextSpan(
                        text: '${WediveTextsFr.andThe} ',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      TextSpan(
                        text: WediveTextsFr.privacyPolicy,
                        style: Theme.of(context).textTheme.labelMedium!.apply(
                          color: dark
                              ? WediveColorsTheme.textWhite
                              : WediveColorsTheme.primaryBlue,
                          decoration: TextDecoration.underline,
                          decorationColor: dark
                              ? WediveColorsTheme.textWhite
                              : WediveColorsTheme.primaryBlue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: WediveSizes.spaceBtwSections),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.to(const SignupSteps()),
              child: Text(WediveTextsFr.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
