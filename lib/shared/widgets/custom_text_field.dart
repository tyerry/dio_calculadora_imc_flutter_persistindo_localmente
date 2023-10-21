import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final TextInputType textType;

  const CustomTextField(
      {super.key,
      required this.label,
      required this.hint,
      required this.controller,
      required this.textType});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: textType,
      style: const TextStyle(
        color: Color(0xFF66ED6C),
        fontSize: 14,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Color(0xFF66ED6C),
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
        hintText: hint,
        hintStyle: const TextStyle(
          color: Color(0xFF8C6147),
          fontSize: 14.0,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF8C6147),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF66ED6C),
          ),
        ),
      ),
    );
  }
}
