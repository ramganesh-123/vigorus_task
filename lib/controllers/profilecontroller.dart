import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var caretakers = 3.obs;
  var caretakersList = [
    {'name': 'Dipa Luna', 'image': 'assets/avatar1.png'},
    {'name': 'Roz Sod...', 'image': 'assets/avatar2.png'},
    {'name': 'Sunny Tu...', 'image': 'assets/avatar3.png'},
  ].obs;

  void addCaretaker(Map<String, String> caretaker) {
    caretakersList.add(caretaker);
    caretakers.value = caretakersList.length;
  }

  void addDoctor() {
    Get.snackbar(
        'Add Doctor', 'Doctor adding functionality will be implemented',
        snackPosition: SnackPosition.BOTTOM);
  }

  void logout() {
    Get.dialog(
      AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              Get.snackbar('Logout', 'Successfully logged out',
                  snackPosition: SnackPosition.BOTTOM);
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
