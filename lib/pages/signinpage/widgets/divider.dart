import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 24),
      child: Row(
        children: [
          Expanded(child: Divider(color: Colors.grey, thickness: 0.5)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child:
                Text('OR', style: TextStyle(color: Colors.grey, fontSize: 12)),
          ),
          Expanded(child: Divider(color: Colors.grey, thickness: 0.5)),
        ],
      ),
    );
  }
}
