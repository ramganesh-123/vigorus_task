import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vigorus_task/controllers/calpolcontroller.dart';
import 'package:vigorus_task/controllers/homecontroller.dart';
import 'package:vigorus_task/controllers/reportcontroller.dart';

class Weekdaywidget extends StatelessWidget {
  Weekdaywidget({super.key});
  final Calpolcontroller controller = Get.put(Calpolcontroller());
  final HomeController homecontroller = Get.put(HomeController());
  final Reportcontroller reportcontroller = Get.put(Reportcontroller());
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildWeekDay('SUN', '1', true),
        _buildWeekDay('MON', '2', false),
        _buildWeekDay('TUE', '3', false),
        _buildWeekDay('WED', '4', false),
        _buildWeekDay('THU', '5', false),
        _buildWeekDay('FRI', '6', false),
      ],
    );
  }

  Widget _buildWeekDay(String day, String date, bool isSelected) {
    return Column(
      children: [
        Text(
          day,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue.shade400 : Colors.grey.shade100,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              date,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
