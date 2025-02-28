import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:vigorus_task/controllers/homecontroller.dart';
import 'package:vigorus_task/pages/profilepage/profilepage.dart';

class Headerwidget extends StatelessWidget {
  Headerwidget({super.key});
  final HomeController controller = Get.put(HomeController());

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
                    'Hi ${controller.userName.value}!',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              Obx(() => Text(
                    '${controller.medicineCount.value} Medicines Left',
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  )),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.email_sharp, color: Color(0xFF6F8BEF), size: 25),
              const SizedBox(width: 12),
              IconButton(
                onPressed: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => ProfileScreen(),
                    ),
                  );
                },
                icon: const CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage('assets/image 1.png'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
