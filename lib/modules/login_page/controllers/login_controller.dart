import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var passwordVisible = false.obs;
  var username = TextEditingController().obs;
  var password = TextEditingController().obs;

  @override
  void onInit() {
    // TODO
    super.onInit();
    // getData();
  }

  @override
  void onClose() {
    print("onCloseonCloseonClose");
    username.value.clear();
    password.value.clear();

    super.onClose();
  }

  @override
  void onDispose() {
    print("disposedisposedispose");
    super.dispose();
  }

  void showHidePassword() {
    passwordVisible.value = !passwordVisible.value;
  }

  void routeToRegisterPage() {
    Get.toNamed('/register');
  }

  void onLogin() {
    Get.toNamed('/product');
    // print("username:${username.value.text}");
    // print("password:${password.value.text}");
  }
}
