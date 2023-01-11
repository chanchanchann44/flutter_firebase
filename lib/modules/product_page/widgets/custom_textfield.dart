import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  const CustomTextfield(
      {super.key, required this.controller, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
      ),
    );
  }
}
