import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vigorus_task/controllers/calpolcontroller.dart';
import 'package:vigorus_task/controllers/homecontroller.dart';

class Headerwidget extends StatelessWidget {
  Headerwidget({super.key});
  final Calpolcontroller controller = Get.put(Calpolcontroller());
  final HomeController homecontroller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(() => Text(
                    'Hi ${homecontroller.userName.value}!',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              Obx(() => Text(
                    '${homecontroller.medicineCount.value} Medicines Left',
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  )),
            ],
          ),
          const Row(
            children: [
              Icon(Icons.email_sharp, color: Color(0xFF6F8BEF), size: 25),
              SizedBox(width: 12),
              CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage('assets/image 1.png'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
