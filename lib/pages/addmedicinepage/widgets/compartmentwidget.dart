import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vigorus_task/controllers/addmedicinecontroller.dart';

class Compartmentwidget extends StatelessWidget {
  Compartmentwidget({super.key});
  final AddMedicineController controller = Get.put(AddMedicineController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Compartment',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              10,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Obx(() {
                  final compartmentNum = index + 1;
                  final isSelected =
                      controller.selectedCompartment.value == compartmentNum;
                  return GestureDetector(
                    onTap: () => controller.selectCompartment(compartmentNum),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.blue[50] : Colors.white,
                        border: Border.all(
                          color: isSelected ? Colors.blue : Colors.grey[300]!,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          '$compartmentNum',
                          style: TextStyle(
                            color: isSelected ? Colors.blue : Colors.black,
                            fontWeight:
                                isSelected ? FontWeight.bold : FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
