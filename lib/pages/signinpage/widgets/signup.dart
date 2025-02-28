import 'package:flutter/material.dart';

class SignupWidget extends StatelessWidget {
  const SignupWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: RichText(
          text: TextSpan(
            text: 'New to Adhicine? ',
            style: const TextStyle(color: Colors.black87, fontSize: 14),
            children: [
              TextSpan(
                text: 'Sign Up',
                style: TextStyle(
                    color: Colors.blue.shade700, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
