import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:vigorus_task/controllers/profilecontroller.dart';

class Buttonwidget extends StatelessWidget {
  Buttonwidget({super.key});
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Caretakers:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 5),
            Obx(() => Text(
                  '0${controller.caretakers.value}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...controller.caretakersList.map((caretaker) =>
                      _buildCaretakerItem(caretaker['name'] as String,
                          caretaker['image'] as String)),
                  _buildAddButton(() {
                    // Add caretaker functionality
                    Get.snackbar('Add Caretaker',
                        'Caretaker adding functionality will be implemented',
                        snackPosition: SnackPosition.BOTTOM);
                  }),
                ],
              )),
        ),
      ],
    );
  }

  Widget _buildCaretakerItem(String name, String imagePath) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.grey[400],
          backgroundImage: const AssetImage('assets/image 1.png'),
        ),
        const SizedBox(height: 5),
        Text(
          name,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildAddButton(VoidCallback onPressed) {
    return const Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.white,
          child: Icon(Icons.add, color: Colors.grey),
        ),
        SizedBox(height: 5),
        Text(
          'Add',
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
