import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: CustomPaint(
                size: const Size(80, 80),
                painter: BoxPainter(),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Nothing Is Here, Add a Medicine',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class BoxPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black87
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final fillPaint = Paint()
      ..color = Colors.black87
      ..style = PaintingStyle.fill;

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double boxSize = size.width * 0.6;

    Path boxPath = Path();

    boxPath.moveTo(centerX - boxSize / 2, centerY - boxSize / 4);
    boxPath.lineTo(centerX, centerY - boxSize / 2);
    boxPath.lineTo(centerX + boxSize / 2, centerY - boxSize / 4);
    boxPath.lineTo(centerX, centerY);
    boxPath.close();

    Path boxSides = Path();
    boxSides.moveTo(centerX - boxSize / 2, centerY - boxSize / 4);
    boxSides.lineTo(centerX - boxSize / 2, centerY + boxSize / 4);
    boxSides.lineTo(centerX, centerY + boxSize / 2);
    boxSides.lineTo(centerX + boxSize / 2, centerY + boxSize / 4);
    boxSides.lineTo(centerX + boxSize / 2, centerY - boxSize / 4);

    canvas.drawPath(boxPath, paint);
    canvas.drawPath(boxSides, paint);

    Path diamondPath = Path();
    diamondPath.moveTo(centerX, centerY - boxSize / 4);
    diamondPath.lineTo(centerX + boxSize / 4, centerY);
    diamondPath.lineTo(centerX, centerY + boxSize / 4);
    diamondPath.lineTo(centerX - boxSize / 4, centerY);
    diamondPath.close();
    canvas.drawPath(diamondPath, fillPaint);

    final Path swirl1 = Path();
    swirl1.moveTo(centerX - boxSize / 2, centerY - boxSize / 2);
    swirl1.quadraticBezierTo(centerX - boxSize / 4, centerY - boxSize,
        centerX - boxSize / 3, centerY - boxSize * 0.7);
    canvas.drawPath(swirl1, paint);

    final Path swirl2 = Path();
    swirl2.moveTo(centerX + boxSize / 3, centerY - boxSize / 2);
    swirl2.quadraticBezierTo(centerX + boxSize / 2, centerY - boxSize * 0.7,
        centerX + boxSize * 0.6, centerY - boxSize * 0.6);
    canvas.drawPath(swirl2, paint);

    canvas.drawCircle(
        Offset(centerX - boxSize / 3, centerY - boxSize * 0.7), 3, paint);
    canvas.drawCircle(
        Offset(centerX + boxSize * 0.6, centerY - boxSize * 0.6), 3, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
