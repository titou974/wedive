import 'package:Wedive/utils/constants/class.dart';
import 'package:Wedive/utils/constants/fr_strings.dart';
import 'package:Wedive/utils/constants/image_strings.dart';

final List<DiveSpot> spots = [
  DiveSpot(
    id: 1.toString(),
    latitude: 37.429725,
    longitude: -122.1,
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
    id: 2.toString(),
    latitude: 37.729725,
    longitude: -123.1,
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
    id: 3.toString(),
    latitude: 37.129725,
    longitude: -122,
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
