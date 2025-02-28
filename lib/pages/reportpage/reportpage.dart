import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:vigorus_task/controllers/calpolcontroller.dart';
import 'package:vigorus_task/controllers/homecontroller.dart';
import 'package:vigorus_task/controllers/reportcontroller.dart';
import 'package:vigorus_task/pages/calpolpage/widgets/medicinewidget.dart';
import 'package:vigorus_task/pages/reportpage/widgets/checkboxwidget.dart';
import 'package:vigorus_task/pages/reportpage/widgets/historywidget.dart';
import 'package:vigorus_task/pages/reportpage/widgets/navwidget.dart';
import 'package:vigorus_task/pages/reportpage/widgets/reportwidget.dart';
import 'package:vigorus_task/pages/reportpage/widgets/weekdaywidget.dart';

class ReportScreen extends StatelessWidget {
  ReportScreen({super.key});
  final Calpolcontroller controller = Get.put(Calpolcontroller());
  final HomeController homecontroller = Get.put(HomeController());
  final Reportcontroller reportcontroller = Get.put(Reportcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Report',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Reportwidget(),
              const SizedBox(height: 16),
              Checkboxwidget(),
              const SizedBox(height: 16),
              const Historywidget(),
              const SizedBox(height: 16),
              Weekdaywidget(),
              const SizedBox(height: 20),
              Medicinewidget(),
              Navgatewidget(),
            ],
          ),
        ),
      ),
    );
  }
}
