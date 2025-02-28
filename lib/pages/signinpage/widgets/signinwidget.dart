import 'package:flutter/material.dart';

class SigninWidget extends StatelessWidget {
  const SigninWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 50, // Half of the height (100/2)
            backgroundImage: AssetImage('assets/adhicine.png'),
          ),
          SizedBox(height: 5),
          Text(
            'Adhicine',
            style: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 18, 86, 142),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
