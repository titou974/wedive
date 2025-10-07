import 'package:Wedive/utils/constants/class.dart';
import 'package:Wedive/utils/constants/fr_strings.dart';
import 'package:Wedive/utils/constants/image_strings.dart';

final List<DiveSpot> spots = [
  DiveSpot(
    imageUrl: WediveImages.spot1,
    title: WediveTextsFr.spot1,
    grade: 8.3,
    divers: 1200,
    diversAvatars: [
      WediveImages.avatar1,
      WediveImages.avatar2,
      WediveImages.avatar3,
    ],
  ),
  DiveSpot(
    imageUrl: WediveImages.spot2,
    title: 'Cap La Houssaye',
    grade: 9.1,
    divers: 950,
    diversAvatars: [
      WediveImages.avatar1,
      WediveImages.avatar2,
      WediveImages.avatar3,
    ],
  ),
  DiveSpot(
    imageUrl: WediveImages.spot3,
    title: 'Trou d\'Eau',
    grade: 7.8,
    divers: 700,
    diversAvatars: [
      WediveImages.avatar1,
      WediveImages.avatar2,
      WediveImages.avatar3,
    ],
  ),
  // Add more spots as needed
];
