import 'package:get/get.dart';

class SignInController extends GetxController {
  var obscureText = true.obs;
  var email = ''.obs;
  var password = ''.obs;
  var emailError = ''.obs;
  var passwordError = ''.obs;

  void validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      emailError.value = 'Incorrect Email Address';
    } else {
      emailError.value = '';
    }
  }

  void validatePassword(String value) {
    if (value.length < 6) {
      passwordError.value = 'Password dont match';
    } else {
      passwordError.value = '';
    }
  }
}
