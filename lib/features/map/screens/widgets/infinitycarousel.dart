// features/map/screens/widgets/infinitycarousel.dart
import 'package:Wedive/features/map/controllers/marker_controller.dart';
import 'package:Wedive/utils/constants/class.dart';
import 'package:Wedive/utils/constants/colors.dart';
import 'package:Wedive/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfinityCarousel extends StatefulWidget {
  final List<DiveSpot>? spots;

  const InfinityCarousel({super.key, this.spots});

  @override
  State<InfinityCarousel> createState() => _InfinityCarouselState();
}

class _InfinityCarouselState extends State<InfinityCarousel> {
  final markerController = Get.find<MarkerController>();
  final CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    if (widget.spots == null || widget.spots!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Positioned(
      left: 0,
      right: 0,
      bottom: WediveSizes.spaceBtwSections,
      child: SizedBox(
        height: 240,
        child: CarouselView(
          controller: carouselController,
          itemExtent: 160,
          shrinkExtent: 160,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 6),
          onTap: (index) {
            // Select spot when tapped
            markerController.selectSpot(widget.spots![index]);
          },
          children: widget.spots!.asMap().entries.map((entry) {
            final spot = entry.value;

            return Obx(() {
              final isSelected =
                  markerController.selectedSpot.value?.id == spot.id;

              return GestureDetector(
                onTap: () => markerController.selectSpot(spot),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  // keep outer radius for shadow/animation
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // image clipped to same radius so it won't overflow corners
                      AnimatedScale(
                        scale: isSelected ? 1.1 : 1.0,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        alignment: Alignment.center,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            spot.imageUrl,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                            errorBuilder: (context, error, stackTrace) =>
                                Image.asset(
                                  'assets/images/spots/fallback.webp',
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                          ),
                        ),
                      ),

                      // dark overlay so text stays readable
                      Positioned.fill(
                        child: IgnorePointer(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.20),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),

                      // draw the border as an overlay so it is always visible on top of the image
                      // always present but animated depending on isSelected
                      Positioned.fill(
                        child: IgnorePointer(
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: isSelected
                                    ? Theme.of(context).colorScheme.secondary
                                    : Colors.transparent,
                                width: 3,
                              ),
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
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                            ),
                            const SizedBox(height: WediveSizes.sm),
                            Text(
                              '+${spot.divers} plongeurs',
                              style: Theme.of(context).textTheme.labelSmall
                                  ?.copyWith(
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black.withOpacity(0.7),
                                        blurRadius: 6,
                                        offset: const Offset(0, 2),
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
                                      offset: Offset(-index * 4.0, 0),
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
                                offset: const Offset(0, 2),
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
                  ),
                ),
              );
            });
          }).toList(),
        ),
      ),
    );
  }
}
