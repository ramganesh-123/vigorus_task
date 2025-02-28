import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vigorus_task/controllers/addmedicinecontroller.dart';

class Takingtimewidget extends StatelessWidget {
  Takingtimewidget({super.key});
  final AddMedicineController controller = Get.put(AddMedicineController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildTakingTimeOption('Before Food'),
          const SizedBox(width: 10),
          _buildTakingTimeOption('After Food'),
          const SizedBox(width: 10),
          _buildTakingTimeOption('Before Sleep'),
        ],
      ),
    );
  }

  Widget _buildTakingTimeOption(String label) {
    return Obx(() {
      final isSelected = controller.selectedTakingTimes.contains(label);
      return GestureDetector(
        onTap: () => controller.toggleTakingTime(label),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue[100] : Colors.grey[100],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.blue[800] : Colors.black,
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      );
    });
  }
}
