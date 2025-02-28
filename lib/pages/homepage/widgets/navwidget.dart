import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vigorus_task/controllers/homecontroller.dart';
import 'package:vigorus_task/pages/addmedicinepage/addmedicine.dart';

class Navwidget extends StatelessWidget {
  Navwidget({super.key});
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // Bottom Navigation Bar
        const SizedBox(
          width: 600,
          height: 100,
        ),
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                spreadRadius: 1,
              ),
            ],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Home Button
              Expanded(
                child: InkWell(
                  onTap: controller.goToHome,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.home, color: Colors.blue, size: 24),
                      Text(
                        'Home',
                        style: TextStyle(color: Colors.blue, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),

              // Empty space for FAB
              // Expanded(child: Container()),

              // Report Button
              Expanded(
                child: InkWell(
                  onTap: controller.goToReports,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.bar_chart, color: Colors.grey, size: 24),
                      Text(
                        'Report',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        // Floating Action Button positioned on top of the nav bar
        Positioned(
          top: 15, // Adjust this value to position the FAB vertically
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 5,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(Icons.add, color: Colors.white, size: 32),
              onPressed: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => AddMedicineScreen(),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
