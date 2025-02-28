import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vigorus_task/controllers/addmedicinecontroller.dart';

class Qualitysectionwidget extends StatelessWidget {
  Qualitysectionwidget({super.key});
  final AddMedicineController controller = Get.put(AddMedicineController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Quantity',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Obx(() => Align(
                      alignment: Alignment.center,
                      child: Text(
                        controller.quantity.value,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
            ),
            const SizedBox(width: 10),
            _buildCounterButton(Icons.remove, controller.decrementCount),
            const SizedBox(width: 10),
            _buildCounterButton(Icons.add, controller.incrementCount,
                isAdd: true),
          ],
        ),
      ],
    );
  }

  Widget _buildCounterButton(IconData icon, VoidCallback onPressed,
      {bool isAdd = false}) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: isAdd ? Colors.blue : Colors.white,
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        icon: Icon(icon, color: isAdd ? Colors.white : Colors.blue),
        onPressed: onPressed,
      ),
    );
  }
}
