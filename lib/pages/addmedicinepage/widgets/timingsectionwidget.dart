import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vigorus_task/controllers/addmedicinecontroller.dart';

class Timingsectionwidget extends StatelessWidget {
  Timingsectionwidget({super.key});
  final AddMedicineController controller = Get.put(AddMedicineController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildDoseRow('Dose 1'),
        const SizedBox(height: 10),
        _buildDoseRow('Dose 2'),
        const SizedBox(height: 10),
        _buildDoseRow('Dose 2'),
      ],
    );
  }

  Widget _buildDoseRow(String dose) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Icon(Icons.access_time, color: Colors.grey),
          const SizedBox(width: 10),
          Text(
            dose,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }
}
