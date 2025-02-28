import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddMedicineController extends GetxController {
  final selectedCompartment = 1.obs;
  final selectedColor = 0.obs;
  final selectedType = 0.obs;
  final quantity = "Take 1/2 Pill".obs;
  final totalCount = 1.obs;
  final frequencyOfDays = "Everyday".obs;
  final timesPerDay = "Three Time".obs;
  final selectedTakingTimes = <String>[].obs;

  final TextEditingController searchController = TextEditingController();

  final List<String> medicineTypes = ['Tablet', 'Capsule', 'Cream', 'Liquid'];
  final List<Color> medicineColors = const [
    Color(0xFFF8BBD0),
    Color(0xFFD1C4E9),
    Color(0xFFFFCDD2),
    Color(0xFFDCEDC8),
    Color(0xFFFFE0B2),
    Color(0xFFB3E5FC),
    Color(0xFFFFFDE7),
  ];

  void selectCompartment(int compartment) {
    selectedCompartment.value = compartment;
  }

  void selectColor(int index) {
    selectedColor.value = index;
  }

  void selectType(int index) {
    selectedType.value = index;
  }

  void incrementCount() {
    if (totalCount.value < 100) {
      totalCount.value++;
    }
  }

  void decrementCount() {
    if (totalCount.value > 1) {
      totalCount.value--;
    }
  }

  void toggleTakingTime(String time) {
    if (selectedTakingTimes.contains(time)) {
      selectedTakingTimes.remove(time);
    } else {
      selectedTakingTimes.add(time);
    }
  }

  bool validateForm() {
    if (searchController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter medicine name',
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }

    if (selectedTakingTimes.isEmpty) {
      Get.snackbar('Error', 'Please select when to take the medicine',
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }

    return true;
  }

  void addMedicine() {
    if (validateForm()) {
      Get.snackbar('Success', 'Medicine added successfully',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
