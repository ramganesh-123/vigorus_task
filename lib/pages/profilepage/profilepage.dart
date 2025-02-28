import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vigorus_task/controllers/profilecontroller.dart';
import 'package:vigorus_task/pages/profilepage/widgets/buttonwidget.dart';
import 'package:vigorus_task/pages/profilepage/widgets/profilewidget.dart';
import 'package:vigorus_task/pages/profilepage/widgets/settingwidget.dart';
import 'package:vigorus_task/pages/profilepage/widgets/textlinkwidget.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Profilewidget(),
                const SizedBox(height: 10),
                const Settingwidget(),
                const SizedBox(height: 25),
                Buttonwidget(),
                const SizedBox(height: 25),
                Textlinkwidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
