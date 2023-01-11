import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/register_controller.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: controller.firstname.value,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'First name',
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: controller.lastname.value,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Last name',
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: controller.email.value,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
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
                Obx(
                  () => TextFormField(
                    controller: controller.confirmPassword.value,
                    obscureText: !controller.passwordVisible.value,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Confirm-Password',
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
                        onPressed: () => {controller.onRegister()},
                        child: const Text('Register'))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
