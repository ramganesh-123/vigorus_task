import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vigorus_task/controllers/calpolcontroller.dart';
import 'package:vigorus_task/controllers/homecontroller.dart';
import 'package:vigorus_task/controllers/reportcontroller.dart';

class Checkboxwidget extends StatelessWidget {
  Checkboxwidget({super.key});
  final Calpolcontroller controller = Get.put(Calpolcontroller());
  final HomeController homecontroller = Get.put(HomeController());
  final Reportcontroller reportcontroller = Get.put(Reportcontroller());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Check Dashboard",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Here you will find everything related to your active and past medicines.",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          SizedBox(
            width: 50,
            height: 50,
            child: CustomPaint(
              painter: DonutChartPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class DonutChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final segments = [
      {'color': Colors.green.shade300, 'percentage': 0.5},
      {'color': Colors.red.shade300, 'percentage': 0.2},
      {'color': Colors.orange.shade300, 'percentage': 0.1},
      {'color': Colors.blue.shade300, 'percentage': 0.2},
    ];

    var startAngle = -90 * (3.14159 / 180);

    for (var segment in segments) {
      final sweepAngle =
          (segment['percentage'] as double) * 360 * (3.14159 / 180);
      final paint = Paint()
        ..color = segment['color'] as Color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 8
        ..strokeCap = StrokeCap.round;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - 4),
        startAngle,
        sweepAngle,
        false,
        paint,
      );

      startAngle += sweepAngle;
    }

    final innerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, radius - 8, innerPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
