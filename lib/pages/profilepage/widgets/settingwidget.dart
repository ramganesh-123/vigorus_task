import 'package:flutter/material.dart';

class Settingwidget extends StatelessWidget {
  const Settingwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSettingItem(Icons.notifications_none, 'Notification',
            'Check your medicine notification'),
        _buildSettingItem(
            Icons.volume_up_outlined, 'Sound', 'Ring, Silent, Vibrate'),
        _buildSettingItem(Icons.person_outline, 'Manage Your Account',
            'Password, Email ID, Phone Number'),
        _buildSettingItem(Icons.notifications_none, 'Notification',
            'Check your medicine notification'),
        _buildSettingItem(Icons.notifications_none, 'Notification',
            'Check your medicine notification'),
        const SizedBox(height: 25),
        const Text(
          'Device',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),

        // Device options
        Container(
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  child: _buildSettingItem(
                      Icons.volume_up_outlined, 'Connect', 'Bluetooth, Wi-Fi'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: _buildSettingItem(Icons.volume_up_outlined,
                      'Sound Option', 'Ring, Silent, Vibrate'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  static Widget _buildSettingItem(
      IconData icon, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey, size: 25),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
