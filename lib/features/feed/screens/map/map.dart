import 'package:Wedive/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:Wedive/common/widgets/logo/logo.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppLogo(isInAppBar: true, little: true),
            SizedBox(height: WediveSizes.sm),
            Text(
              'Saint-Gilles les Bains, France',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: WediveSizes.defaultSpace),
            child: IconButton(
              onPressed: () {
                // Handle avatar button tap
              },
              icon: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(
                  'assets/images/avatar.jpg',
                ), // Replace with your asset path
              ),
            ),
          ),
        ],
      ),
      body: const Center(child: Text('Map functionality goes here')),
    );
  }
}
