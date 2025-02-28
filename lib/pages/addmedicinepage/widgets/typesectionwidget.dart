import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/addmedicinecontroller.dart';

class Typesectionwidget extends StatelessWidget {
  Typesectionwidget({super.key});
  final AddMedicineController controller = Get.put(AddMedicineController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Type',
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
              controller.medicineTypes.length,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Obx(() {
                  final isSelected = controller.selectedType.value == index;
                  return GestureDetector(
                    onTap: () => controller.selectType(index),
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Column(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.blue[50]
                                  : Colors.pink[50],
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: _getMedicineTypeIcon(index),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            controller.medicineTypes[index],
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
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

  Widget _getMedicineTypeIcon(int index) {
    switch (index) {
      case 0:
        return Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.pink[100],
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Container(
              width: 15,
              height: 2,
              color: Colors.white,
            ),
          ),
        );
      case 1:
        return Transform.rotate(
          angle: 3.14 / 4,
          child: Container(
            width: 30,
            height: 15,
            decoration: BoxDecoration(
              color: Colors.pink[100],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      case 2:
        return Container(
          width: 20,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.pink[100],
            borderRadius: BorderRadius.circular(5),
          ),
        );
      case 3:
        return Container(
          width: 15,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.pink[100],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
          ),
        );
      default:
        return Container();
    }
  }
}
