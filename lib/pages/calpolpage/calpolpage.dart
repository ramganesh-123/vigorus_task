import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:vigorus_task/controllers/calpolcontroller.dart';
import 'package:vigorus_task/controllers/homecontroller.dart';
import 'package:vigorus_task/pages/calpolpage/widgets/bottomwidget.dart';
import 'package:vigorus_task/pages/calpolpage/widgets/dateselectorwidget.dart';
import 'package:vigorus_task/pages/calpolpage/widgets/medicinewidget.dart';
import 'package:vigorus_task/pages/homepage/widgets/headerwidget.dart';

class CalpolScreen extends StatelessWidget {
  CalpolScreen({super.key});
  final Calpolcontroller controller = Get.put(Calpolcontroller());
  final HomeController homecontroller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Headerwidget(),
            Dateselectorwidget(),
            Medicinewidget(),
            Bottomwidget(),
          ],
        ),
      ),
    );
  }
}
