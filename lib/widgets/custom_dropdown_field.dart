import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class CustomDropdownField extends StatelessWidget {
  final String hintText;
  final List<String> options;
  final Function(String?)? onChanged;
  final String? selectedValue;
  final bool isRequired; // Campo obrigatório

  CustomDropdownField({
    required this.hintText,
    required this.options,
    this.onChanged,
    this.selectedValue,
    this.isRequired = true, // Define o padrão como obrigatório
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      value: selectedValue,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFF3F3F3),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 16,
          fontFamily: 'Poppins',
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 13, horizontal: 17),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: BorderSide.none,
        ),
      ),
      onChanged: onChanged,
      items: options.map((String option) {
        return DropdownMenuItem<String>(
          value: option,
          child: Text(option),
        );
      }).toList(),
      validator: (value) {
        if (isRequired && value == null) {
          return 'Por favor, selecione $hintText'; // Validação condicional
        }
        return null;
      },
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          color: Color(0xFFF3F3F3),
          borderRadius: BorderRadius.circular(9),
        ),
      ),
    );
  }
}
