import 'package:flutter/material.dart';
import 'package:vigorus_task/pages/homepage/homepage.dart';

class SigninButton extends StatelessWidget {
  const SigninButton({super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push<void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => HomeScreen(),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue.shade400,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
      child: const Text(
        'Sign In',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
