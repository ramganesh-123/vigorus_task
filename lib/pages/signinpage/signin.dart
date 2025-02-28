import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:vigorus_task/controllers/signin_controllers.dart';
import 'package:vigorus_task/pages/signinpage/widgets/divider.dart';
import 'package:vigorus_task/pages/signinpage/widgets/googlebutton.dart';
import 'package:vigorus_task/pages/signinpage/widgets/signinbutton.dart';
import 'package:vigorus_task/pages/signinpage/widgets/signinwidget.dart';
import 'package:vigorus_task/pages/signinpage/widgets/signup.dart';
import 'package:vigorus_task/pages/signinpage/widgets/textemail.dart';
import 'package:vigorus_task/pages/signinpage/widgets/textpassword.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final SignInController controller = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 30),
                const SigninWidget(),
                const SizedBox(height: 40),
                const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                TextEmail(),
                const SizedBox(height: 16),
                TextPassword(),
                const SizedBox(height: 24),
                const SigninButton(),
                const DividerWidget(),
                const GoogleButton(),
                const SizedBox(height: 30),
                const SignupWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
