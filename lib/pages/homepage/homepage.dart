import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:vigorus_task/controllers/homecontroller.dart';
import 'package:vigorus_task/pages/homepage/widgets/datewidget.dart';
import 'package:vigorus_task/pages/homepage/widgets/emptyswidget.dart';
import 'package:vigorus_task/pages/homepage/widgets/headerwidget.dart';
import 'package:vigorus_task/pages/homepage/widgets/navwidget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Headerwidget(),
            Datewidget(),
            const Expanded(
              child: EmptyWidget(),
            ),
            Navwidget(),
          ],
        ),
      ),
    );
  }
}
