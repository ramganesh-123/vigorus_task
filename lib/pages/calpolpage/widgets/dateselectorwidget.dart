import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vigorus_task/controllers/calpolcontroller.dart';
import 'package:vigorus_task/controllers/homecontroller.dart';

class Dateselectorwidget extends StatelessWidget {
  Dateselectorwidget({super.key});
  final Calpolcontroller controller = Get.put(Calpolcontroller());
  final HomeController homecontroller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text('Thurday', style: TextStyle(color: Colors.grey)),
          const SizedBox(width: 20),
          const Text('Friday', style: TextStyle(color: Colors.grey)),
          IconButton(
            icon: const Icon(
              Icons.chevron_left,
              color: Color(0xFF6F8BEF),
            ),
            onPressed: () {
              controller.changeDate(controller.selectedDate.value
                  .subtract(const Duration(days: 1)));
            },
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Obx(() => Text(
                  homecontroller.getFormattedDate(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                )),
          ),
          IconButton(
            icon: const Icon(
              Icons.chevron_right,
              color: Color(0xFF6F8BEF),
            ),
            onPressed: () {
              controller.changeDate(
                  controller.selectedDate.value.add(const Duration(days: 1)));
            },
          ),
          const Text('Sunday', style: TextStyle(color: Colors.grey)),
          const SizedBox(width: 20),
          const Text('Monday', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
