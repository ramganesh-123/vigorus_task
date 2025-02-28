import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vigorus_task/controllers/calpolcontroller.dart';

class Reportcontroller extends GetxController {
  var medicines = <Medicine>[].obs;
  var selectedDate = DateTime.now().obs;
  var remainingMedicines = 5.obs;

  var totalMedicines = 5.obs;
  var takenMedicines = 3.obs;
  var missedMedicines = 1.obs;
  var snoozedMedicines = 1.obs;
  final RxBool isDialogVisible = false.obs;
  final RxBool isBluetoothConnected = false.obs;
  final RxBool isWifiConnected = false.obs;

  void toggleDialog() {
    isDialogVisible.value = !isDialogVisible.value;
  }

  void connectBluetooth() {
    isBluetoothConnected.value = true;
    if (checkConnection()) {
      isDialogVisible.value = false;
    }
  }

  void connectWifi() {
    isWifiConnected.value = true;
    if (checkConnection()) {
      isDialogVisible.value = false;
    }
  }

  bool checkConnection() {
    return isBluetoothConnected.value || isWifiConnected.value;
  }

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
        color: Colors.purple.shade100,
        icon: Icons.water_drop,
      ),
      Medicine(
        name: 'Calpol 500mg Tablet',
        time: 'Morning 08:00 am',
        instructions: 'Before Breakfast',
        day: 27,
        status: MedicineStatus.missed,
        color: Colors.pink.shade100,
        icon: Icons.medication,
      ),
      Medicine(
        name: 'Calpol 500mg Tablet',
        time: 'Afternoon 02:00 pm',
        instructions: 'After Food',
        day: 1,
        status: MedicineStatus.snoozed,
        color: Colors.purple.shade100,
        icon: Icons.water_drop,
      ),
    ]);
  }

  void changeDate(DateTime date) {
    selectedDate.value = date;
  }

  String getFormattedSelectedDate() {
    return DateFormat('EEEE, MMM d').format(selectedDate.value);
  }

  void updateMedicineStatus(int index, MedicineStatus status) {
    Medicine medicine = medicines[index];
    MedicineStatus oldStatus = medicine.status;

    _decrementStatusCounter(oldStatus);
    _incrementStatusCounter(status);

    medicine.status = status;
    medicines.refresh();
  }

  void _decrementStatusCounter(MedicineStatus status) {
    switch (status) {
      case MedicineStatus.taken:
        if (takenMedicines.value > 0) takenMedicines--;
        break;
      case MedicineStatus.missed:
        if (missedMedicines.value > 0) missedMedicines--;
        break;
      case MedicineStatus.snoozed:
        if (snoozedMedicines.value > 0) snoozedMedicines--;
        break;
      case MedicineStatus.left:
        if (remainingMedicines.value > 0) remainingMedicines--;
        break;
    }
  }

  void _incrementStatusCounter(MedicineStatus status) {
    switch (status) {
      case MedicineStatus.taken:
        takenMedicines++;
        break;
      case MedicineStatus.missed:
        missedMedicines++;
        break;
      case MedicineStatus.snoozed:
        snoozedMedicines++;
        break;
      case MedicineStatus.left:
        remainingMedicines++;
        break;
    }
  }
}

class Medicines {
  final String name;
  final String time;
  final String instructions;
  final int day;
  MedicineStatus status;
  final Color color;
  final IconData icon;

  Medicines({
    required this.name,
    required this.time,
    required this.instructions,
    required this.day,
    required this.status,
    required this.color,
    required this.icon,
  });
}
