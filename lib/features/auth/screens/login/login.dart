import 'package:Wedive/common/styles/spacing_styles.dart';
import 'package:Wedive/features/auth/screens/onboarding/widgets/onboarding_logo.dart';
import 'package:Wedive/utils/constants/colors.dart';
import 'package:Wedive/utils/constants/fr_strings.dart';
import 'package:Wedive/utils/constants/sizes.dart';
import 'package:Wedive/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';

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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        WediveTextsFr.loginTitle,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: WediveSizes.sm),
                      Text(
                        WediveTextsFr.loginSubtitle,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  Form(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: WediveSizes.spaceBtwSections,
                      ),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Iconsax.direct_right),
                              labelText: WediveTextsFr.emailLabel,
                            ),
                          ),
                          const SizedBox(
                            height: WediveSizes.spaceBtwInputFields,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Iconsax.password_check),
                              labelText: WediveTextsFr.passwordLabel,
                              suffixIcon: Icon(Iconsax.eye_slash),
                            ),
                          ),
                          const SizedBox(
                            height: WediveSizes.spaceBtwInputFields / 2,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(value: false, onChanged: (value) {}),
                                  Text(
                                    WediveTextsFr.rememberMe,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.labelLarge,
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(WediveTextsFr.forgotPassword),
                              ),
                            ],
                          ),
                          const SizedBox(height: WediveSizes.spaceBtwSections),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(WediveTextsFr.signIn),
                            ),
                          ),
                          const SizedBox(height: WediveSizes.spaceBtwItems),
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              onPressed: () {},
                              child: Text(WediveTextsFr.signUp),
                            ),
                          ),
                          const SizedBox(height: WediveSizes.spaceBtwSections),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Divider(
                          color: dark
                              ? WediveColorsTheme.textLightGrey
                              : WediveColorsTheme.textLightGrey,
                          thickness: 0.5,
                          indent: 30,
                          endIndent: 5,
                        ),
                      ),
                      Text(
                        WediveTextsFr.orSignInWith,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Flexible(
                        child: Divider(
                          color: dark
                              ? WediveColorsTheme.textLightGrey
                              : WediveColorsTheme.textLightGrey,
                          thickness: 0.5,
                          indent: 5,
                          endIndent: 30,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: WediveSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: WediveColorsTheme.textLightGrey,
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/icons/google.svg',
                            width: WediveSizes.iconMd,
                            height: WediveSizes.iconMd,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
