import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Calpolcontroller extends GetxController {
  var medicines = <Medicine>[].obs;
  var selectedDate = DateTime.now().obs;
  var remainingMedicines = 5.obs;
  var totalMedicines = 5.obs;
  var takenMedicines = 3.obs;
  var missedMedicines = 1.obs;
  var snoozedMedicines = 1.obs;

  @override
  void onInit() {
    super.onInit();
    medicines.addAll([
      Medicine(
        name: 'Calpol 500mg Tablet',
        time: 'Morning 08:00 am',
        instructions: 'Before Breakfast',
        day: 1,
        status: MedicineStatus.taken,
        color: Colors.pink.shade100,
        icon: Icons.water_drop,
      ),
      Medicine(
        name: 'Calpol 500mg Tablet',
        time: 'Morning 08:00 am',
        instructions: 'Before Breakfast',
        day: 27,
        status: MedicineStatus.missed,
        color: Colors.blue.shade100,
        icon: Icons.medication,
      ),
      Medicine(
        name: 'Calpol 500mg Tablet',
        time: 'Afternoon 02:00 pm',
        instructions: 'After Food',
        day: 1,
        status: MedicineStatus.snoozed,
        color: Colors.purple.shade100,
        icon: Icons.water_drop_outlined,
      ),
      Medicine(
        name: 'Calpol 500mg Tablet',
        time: 'Night 09:00 pm',
        instructions: 'Before Sleep',
        day: 3,
        status: MedicineStatus.left,
        color: Colors.red.shade100,
        icon: Icons.edit,
      ),
    ]);
  }

  void changeDate(DateTime date) {
    selectedDate.value = date;
  }

  void updateMedicineStatus(int index, MedicineStatus status) {
    medicines[index].status = status;
    if (status == MedicineStatus.taken) {
      remainingMedicines--;
    } else if (status == MedicineStatus.left) {
      remainingMedicines++;
    }
    medicines.refresh();
  }

  String getFormattedSelectedDate() {
    return DateFormat('EEEE, MMM d').format(selectedDate.value);
  }
}

enum MedicineStatus { taken, missed, snoozed, left }

class Medicine {
  final String name;
  final String time;
  final String instructions;
  final int day;
  MedicineStatus status;
  final Color color;
  final IconData icon;

  Medicine({
    required this.name,
    required this.time,
    required this.instructions,
    required this.day,
    required this.status,
    required this.color,
    required this.icon,
  });
}
