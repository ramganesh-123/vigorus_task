import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vigorus_task/controllers/calpolcontroller.dart';
import 'package:vigorus_task/controllers/homecontroller.dart';
import 'package:vigorus_task/controllers/reportcontroller.dart';
import 'package:vigorus_task/pages/profilepage/profilepage.dart';
import 'package:vigorus_task/pages/signinpage/signin.dart';

class Navgatewidget extends StatelessWidget {
  Navgatewidget({super.key});
  final Calpolcontroller controller = Get.put(Calpolcontroller());
  final HomeController homecontroller = Get.put(HomeController());
  final Reportcontroller reportcontroller = Get.put(Reportcontroller());
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
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
              Expanded(
                child: InkWell(
                  onTap: homecontroller.goToHome,
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
              Expanded(
                child: InkWell(
                  onTap: homecontroller.goToReports,
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
        Positioned(
          top: 15,
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
                _showConnectionDialog(context);
              },
            ),
          ),
        ),
      ],
    );
  }

  void _showConnectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        var statefulBuilder = StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: 250,
                height: 360,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 24),
                    const Text(
                      'Your Device is not',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'connected',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 140,
                      width: 140,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.blue.shade200,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Positioned(
                            child: CustomPaint(
                              size: const Size(100, 100),
                              painter: MascotPainter(),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 20,
                            child: Icon(Icons.flash_on,
                                color: Colors.blue.shade100, size: 20),
                          ),
                          Positioned(
                            bottom: 35,
                            left: 5,
                            child: Transform.rotate(
                              angle: -0.5,
                              child: Container(
                                width: 10,
                                height: 30,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Connect your device with',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 34),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade400,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                Navigator.push<void>(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        SignInScreen(),
                                  ),
                                );
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                  ),
                                ),
                              ),
                              child: const Icon(Icons.bluetooth),
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 30,
                            color: Colors.white,
                          ),
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                Navigator.push<void>(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        ProfileScreen(),
                                  ),
                                );
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                              ),
                              child: const Icon(Icons.wifi),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
        return statefulBuilder;
      },
    );
  }
}

class MascotPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint blackPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawLine(
      Offset(size.width * 0.3, size.height * 0.3),
      Offset(size.width * 0.4, size.height * 0.4),
      blackPaint..strokeWidth = 3,
    );
    canvas.drawLine(
      Offset(size.width * 0.4, size.height * 0.3),
      Offset(size.width * 0.3, size.height * 0.4),
      blackPaint..strokeWidth = 3,
    );

    canvas.drawLine(
      Offset(size.width * 0.6, size.height * 0.3),
      Offset(size.width * 0.7, size.height * 0.4),
      blackPaint..strokeWidth = 3,
    );
    canvas.drawLine(
      Offset(size.width * 0.7, size.height * 0.3),
      Offset(size.width * 0.6, size.height * 0.4),
      blackPaint..strokeWidth = 3,
    );

    final Paint mouthPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final Path mouthPath = Path();
    mouthPath.moveTo(size.width * 0.3, size.height * 0.7);
    mouthPath.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.8,
      size.width * 0.7,
      size.height * 0.7,
    );
    canvas.drawPath(mouthPath, mouthPaint);

    final Paint bodyPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final Rect bodyRect = Rect.fromLTWH(size.width * 0.35, size.height * 0.6,
        size.width * 0.3, size.height * 0.25);
    canvas.drawRect(bodyRect, bodyPaint);

    final Paint screenPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final Rect screenRect = Rect.fromLTWH(size.width * 0.38, size.height * 0.65,
        size.width * 0.24, size.height * 0.15);
    canvas.drawRect(screenRect, screenPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
