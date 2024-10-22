import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool isRequired;
  final String? Function(String?)? validator;
  final int? maxLines; // Adiciona o parâmetro maxLines
  final int? maxLength;

  CustomTextField({
    required this.hintText,
    this.controller,
    this.isRequired = true,
    this.validator,
    this.maxLines = 1,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines, // Passa o maxLines para o TextFormField
      maxLength: maxLength,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFF3F3F3),
        hintText: hintText,
        counterText: "",
        hintStyle: TextStyle(
          fontSize: 16,
          fontFamily: 'Poppins',
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        contentPadding: EdgeInsets.only(
          left: 17,
          top: 17,
          bottom: 9.33,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: BorderSide.none,
        ),
      ),
      validator: validator ??
              (value) {
            if (isRequired && (value == null || value.isEmpty)) {
              return 'Por favor, insira $hintText';
            }
            return null;
          },
    );
  }
}
