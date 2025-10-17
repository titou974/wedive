import 'package:Wedive/common/widgets/login_signup/header.dart';
import 'package:Wedive/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SignupStepsPage extends StatelessWidget {
  const SignupStepsPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.stepContent,
    this.headerWidget,
    this.footerWidget,
  });

  final String title;
  final String subtitle;
  final Widget stepContent;
  final Widget?
  headerWidget; // optional custom header (replaces title/subtitle)
  final Widget? footerWidget; // optional custom footer (button, etc.)

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(WediveSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // use custom header when provided, otherwise default Header with title/subtitle
          headerWidget ?? Header(title: title, subtitle: subtitle),
          SizedBox(height: WediveSizes.spaceBtwSections),
          // step content occupies remaining space
          Expanded(child: stepContent),
          // optional footer widget (e.g. navigation button). placed below content.
          if (footerWidget != null) ...[
            SizedBox(height: WediveSizes.sm),
            footerWidget!,
          ],
        ],
      ),
    );
  }
}
