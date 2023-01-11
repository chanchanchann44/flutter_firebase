import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: controller.username.value,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Obx(
                  () => TextFormField(
                    controller: controller.password.value,
                    obscureText: !controller.passwordVisible.value,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.passwordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: () {
                          controller.showHidePassword();
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                    height: 50,
                    width: Get.width / 2,
                    child: ElevatedButton(
                        onPressed: () => {controller.onLogin()},
                        child: const Text('Login'))),
                TextButton(
                    onPressed: () => controller.routeToRegisterPage(),
                    child: const Text('Register'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
