import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var medicineCount = 5.obs;
  var userName = "Harry".obs;

  void changeDate(DateTime date) {
    selectedDate.value = date;
  }

  void addMedicine() {
    Get.snackbar(
      'Add Medicine',
      'Add new medicine functionality',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  String getFormattedDate() {
    return DateFormat('EEEE, MMM d').format(selectedDate.value);
  }

  void goToReports() {
    Get.snackbar(
      'Reports',
      'Navigate to reports screen',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void goToHome() {
    Get.snackbar(
      'Home',
      'You are already on the home screen',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
