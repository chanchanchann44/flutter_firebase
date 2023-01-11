import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  var passwordVisible = false.obs;
  var firstname = TextEditingController().obs;
  var lastname = TextEditingController().obs;
  var email = TextEditingController().obs;
  var username = TextEditingController().obs;
  var password = TextEditingController().obs;
  var confirmPassword = TextEditingController().obs;

  @override
  void onInit() {
    // TODO
    super.onInit();
    // getData();
  }

  void showHidePassword() {
    passwordVisible.value = !passwordVisible.value;
  }

  void onRegister() {
    print("firstname:${firstname.value.text}");
    print("lastname:${lastname.value.text}");
    print("email:${email.value.text}");
    print("username:${username.value.text}");
    print("password:${password.value.text}");
    print("confirmPassword:${username.value.text}");
  }
}
