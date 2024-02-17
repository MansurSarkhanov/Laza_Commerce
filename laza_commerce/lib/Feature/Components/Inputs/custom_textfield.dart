import 'package:flutter/material.dart';
import 'package:laza_commerce/Product/Constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
  });

  final TextEditingController controller;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400, width: 0.8),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor, width: 0.8),
        ),
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w300),
      ),
    );
  }
}
