import 'package:Wedive/common/widgets/login_signup/header.dart';
import 'package:Wedive/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SignupStepsPage extends StatelessWidget {
  const SignupStepsPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.stepContent,
  });

  final String title, subtitle;
  final Widget stepContent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(WediveSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(title: title, subtitle: subtitle),
          SizedBox(height: WediveSizes.spaceBtwSections),
          Expanded(child: stepContent),
          // Add your activity selection widgets here
          // For example, a list of checkboxes or buttons for activities
        ],
      ),
    );
  }
}
