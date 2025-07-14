import 'package:Wedive/features/auth/screens/signup/signup.dart';
import 'package:Wedive/utils/constants/fr_strings.dart';
import 'package:Wedive/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: WediveSizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: WediveTextsFr.emailLabel,
              ),
            ),
            const SizedBox(height: WediveSizes.spaceBtwInputFields),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: WediveTextsFr.passwordLabel,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(height: WediveSizes.spaceBtwInputFields / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (value) {}),
                    Text(
                      WediveTextsFr.rememberMe,
                      style: Theme.of(context).textTheme.labelLarge,
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
                onPressed: () =>
                    Get.to(SignupScreen()), // Assuming you have a SignupScreen
                child: Text(WediveTextsFr.signUp),
              ),
            ),
            const SizedBox(height: WediveSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}
