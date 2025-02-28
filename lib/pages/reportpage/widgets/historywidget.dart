import 'package:flutter/material.dart';

class Historywidget extends StatelessWidget {
  const Historywidget({super.key});
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Check History",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Icon(
          Icons.chevron_right,
          color: Colors.blue,
          size: 24,
        ),
      ],
    );
  }
}
