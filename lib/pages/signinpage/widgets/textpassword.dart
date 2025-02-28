import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:vigorus_task/controllers/signin_controllers.dart';

class TextPassword extends StatelessWidget {
  TextPassword({super.key});

  final SignInController controller = Get.put(SignInController());
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(() => Icon(
              Icons.lock_outline,
              color: controller.password.value.isEmpty
                  ? Colors.teal.shade300
                  : (controller.password.value.length < 6
                      ? Colors.red.shade400
                      : Colors.teal.shade300),
            )),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => TextField(
                  obscureText: controller.obscureText.value,
                  onChanged: (value) {
                    controller.password.value = value;
                    controller.validatePassword(value);
                  },
                  decoration: InputDecoration(
                    hintText: 'Password',
                    errorText: controller.passwordError.value.isEmpty
                        ? null
                        : controller.passwordError.value,
                    border: const UnderlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.obscureText.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: controller.password.value.isEmpty
                            ? Colors.teal.shade300
                            : (controller.password.value.length < 6
                                ? Colors.red.shade400
                                : Colors.teal.shade300),
                      ),
                      onPressed: () {
                        controller.obscureText.toggle();
                      },
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.blue.shade300, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
