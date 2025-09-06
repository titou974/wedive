import 'package:Wedive/common/widgets/appbar/appbar.dart';
import 'package:Wedive/common/widgets/avatar/avatar.dart';
import 'package:Wedive/utils/constants/colors.dart';
import 'package:Wedive/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:Wedive/common/widgets/logo/logo.dart';

class DiveSpot {
  final String imageUrl;
  final String title;
  final double grade;
  final int divers;
  final List<String> diversAvatars;

  DiveSpot({
    required this.imageUrl,
    required this.title,
    required this.grade,
    required this.divers,
    required this.diversAvatars,
  });
}

// Example list
final List<DiveSpot> spots = [
  DiveSpot(
    imageUrl: 'assets/images/spot1.jpg',
    title: 'La Passe de l\'Hermitage',
    grade: 8.3,
    divers: 1200,
    diversAvatars: [
      'assets/images/avatar1.jpg',
      'assets/images/avatar2.jpg',
      'assets/images/avatar3.jpg',
    ],
  ),
  DiveSpot(
    imageUrl: 'assets/images/spot2.jpg',
    title: 'Le Tombant de Trois Bassins',
    grade: 9.1,
    divers: 950,
    diversAvatars: [
      'assets/images/avatar1.jpg',
      'assets/images/avatar2.jpg',
      'assets/images/avatar3.jpg',
    ],
  ),
  DiveSpot(
    imageUrl: 'assets/images/spot3.jpg',
    title: 'La Pointe au Sel',
    grade: 7.8,
    divers: 700,
    diversAvatars: [
      'assets/images/avatar1.jpg',
      'assets/images/avatar2.jpg',
      'assets/images/avatar3.jpg',
    ],
  ),
  // Add more spots as needed
];

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavHeight = 80.0; // Same as NavigationBar height

    return Scaffold(
      body: Stack(
        children: [
          // Main content (e.g., map, etc.)
          Column(
            children: [
              WediveAppBar(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppLogo(isInAppBar: true, little: true),
                    SizedBox(height: WediveSizes.sm),
                    Text(
                      'Saint-Gilles les Bains, France',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: WediveColorsTheme.accentBlue,
                      ),
                    ),
                  ],
                ),
                actions: [const Avatar(imageUrl: 'assets/images/yo.jpg')],
              ),
              // You can add your map or other content here
              Expanded(child: Container()), // Placeholder for map/content
            ],
          ),
          // Carousel positioned at the bottom, above the nav bar
          Positioned(
            left: 0,
            right: 0,
            bottom:
                WediveSizes.spaceBtwSections, // 16 for spacing above nav bar
            child: SizedBox(
              height: 240,
              child: CarouselView(
                itemExtent: 160,
                shrinkExtent: 160,
                padding: const EdgeInsets.symmetric(horizontal: 6),
                children: spots.asMap().entries.map((entry) {
                  final index = entry.key;
                  final spot = entry.value;
                  return Stack(
                    children: [
                      Container(
                        color: Colors.grey,
                        child: Opacity(
                          opacity: 0.90,
                          child: Image.asset(
                            spot.imageUrl,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                            errorBuilder: (context, error, stackTrace) =>
                                Image.asset(
                                  'assets/images/fallback.jpg', // fallback image
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 12,
                        right: 12,
                        top: 24,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              spot.title,
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black.withOpacity(0.7),
                                        blurRadius: 6,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                            ),
                            const SizedBox(height: WediveSizes.xs),
                            Text(
                              '+${spot.divers} plongeurs',
                              style: Theme.of(context).textTheme.labelSmall
                                  ?.copyWith(
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black.withOpacity(0.7),
                                        blurRadius: 6,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                            ),
                          ],
                        ),
                      ),
                      // Blue square with grade
                      Positioned(
                        bottom: 12,
                        right: 12,
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: WediveColorsTheme.secondaryBlue,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            spot.grade.toStringAsFixed(1),
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
