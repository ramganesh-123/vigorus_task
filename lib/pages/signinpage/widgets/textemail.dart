import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:vigorus_task/controllers/signin_controllers.dart';

class TextEmail extends StatelessWidget {
  TextEmail({super.key});

  final SignInController controller = Get.put(SignInController());
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.alternate_email, color: Colors.teal.shade300),
        const SizedBox(width: 12),
        Expanded(
          child: Obx(
            () => TextField(
              onChanged: (value) {
                controller.email.value = value;
                controller.validateEmail(value);
              },
              decoration: InputDecoration(
                hintText: 'Email',
                errorText: controller.emailError.value.isEmpty
                    ? null
                    : controller.emailError.value,
                border: const UnderlineInputBorder(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
