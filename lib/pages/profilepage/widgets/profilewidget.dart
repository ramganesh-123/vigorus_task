import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profilewidget extends StatelessWidget {
  const Profilewidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => Get.back(),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            const Stack(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey,
                  backgroundImage: AssetImage('assets/image 1.png'),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.camera_alt,
                      size: 16,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Take Care!',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Richa Bose',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 25),
        const Divider(),
        const SizedBox(height: 10),
        const Text(
          'Settings',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
