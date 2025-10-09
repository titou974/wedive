import 'package:Wedive/utils/constants/class.dart';
import 'package:Wedive/utils/constants/colors.dart';
import 'package:Wedive/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class InfinityCarousel extends StatelessWidget {
  final List<DiveSpot>? spots;

  const InfinityCarousel({super.key, this.spots});

  @override
  Widget build(BuildContext context) {
    if (spots == null || spots!.isEmpty) {
      return const SizedBox.shrink(); // Don't display carousel if no spots
    }
    return SizedBox(
      height: 240,
      child: CarouselView(
        itemExtent: 160,
        shrinkExtent: 160,
        padding: const EdgeInsets.symmetric(horizontal: 6),
        children: spots!.asMap().entries.map((entry) {
          final spot = entry.value;
          return Stack(
            children: [
              Container(
                color: Colors.grey,
                child: Opacity(
                  opacity: 1,
                  child: Image.asset(
                    spot.imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    errorBuilder: (context, error, stackTrace) => Image.asset(
                      'assets/images/spots/fallback.webp', // fallback image
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
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
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
                    const SizedBox(height: WediveSizes.sm),
                    Text(
                      '+${spot.divers} plongeurs',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
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
                    const SizedBox(height: WediveSizes.xs),
                    Row(
                      children: spot.diversAvatars
                          .take(3)
                          .toList()
                          .asMap()
                          .entries
                          .map((entry) {
                            final index = entry.key;
                            final avatarUrl = entry.value;
                            return Transform.translate(
                              offset: Offset(
                                -index * 4.0,
                                0,
                              ), // Décale chaque avatar vers la gauche
                              child: CircleAvatar(
                                radius: 6,
                                backgroundImage: AssetImage(avatarUrl),
                                backgroundColor: Colors.grey[300],
                              ),
                            );
                          })
                          .toList(),
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
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
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
    );
  }
}
