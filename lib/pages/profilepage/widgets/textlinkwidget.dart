import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:vigorus_task/controllers/profilecontroller.dart';

class Textlinkwidget extends StatelessWidget {
  Textlinkwidget({super.key});
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Doctor',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),

        // Add Doctor section
        Container(
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 25,
                backgroundColor: Colors.blue,
                child: Icon(Icons.add, color: Colors.white, size: 30),
              ),
              const SizedBox(height: 10),
              const Text(
                'Add Your Doctor',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Or use ',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'invite link',
                    style: TextStyle(fontSize: 14, color: Colors.orange),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 25),
        // Bottom links
        _buildTextLink('Privacy Policy'),
        _buildTextLink('Terms of Use'),
        _buildTextLink('Rate Us'),
        _buildTextLink('Share'),

        const SizedBox(height: 20),
        // Logout button
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 20),
          child: OutlinedButton(
            onPressed: controller.logout,
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.blue),
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              'Log Out',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextLink(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class AccountValidator {
  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email is required';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  static String? validatePhone(String value) {
    if (value.isEmpty) {
      return 'Phone number is required';
    }
    if (!GetUtils.isPhoneNumber(value)) {
      return 'Enter a valid phone number';
    }
    return null;
  }
}
