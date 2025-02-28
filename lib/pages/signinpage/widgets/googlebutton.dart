import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});
  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.grey, width: 1),
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
      icon: Image.asset('assets/google.png', height: 30, width: 30),
      label: const Text(
        'Continue with Google',
        style: TextStyle(color: Colors.black87, fontSize: 16),
      ),
    );
  }
}
