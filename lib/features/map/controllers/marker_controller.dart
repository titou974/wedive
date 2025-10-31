// features/map/controllers/marker_controller.dart
import 'package:get/get.dart';
import 'package:Wedive/utils/constants/class.dart';

class MarkerController extends GetxController {
  static MarkerController get instance => Get.find<MarkerController>();

  // Selected spot (reactive)
  Rxn<DiveSpot> selectedSpot = Rxn<DiveSpot>();

  // All spots
  RxList<DiveSpot> spots = <DiveSpot>[].obs;

  void selectSpot(DiveSpot? spot) {
    selectedSpot.value = spot;
  }

  void loadSpots(List<DiveSpot> spotsList) {
    spots.value = spotsList;
  }

  int? getSelectedIndex() {
    if (selectedSpot.value == null) return null;
    return spots.indexWhere((spot) => spot.id == selectedSpot.value!.id);
  }
}
