import 'package:flutter/material.dart';
import 'package:primetime/common/constants/constants.dart';
import 'package:primetime/common/widgets/squared_text_field_container.dart';
class SquaredInputField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final String helperText;
  final TextInputType textInputType;
  final IconData icon;
  final int maxLength;
  final ValueChanged<String> onChanged;
  final TextEditingController? controller;
  // final String? Function(String?)? validator;
  // final void Function(String?)? onSaved;
  const SquaredInputField({
    super.key, required this.labelText, required this.hintText, this.helperText = '', this.textInputType = TextInputType.text, this.icon = Icons.phone, this.maxLength = 100, this.controller, required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SquaredTextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        keyboardType: textInputType,
        controller: controller ?? TextEditingController(),
        maxLength: maxLength,
          decoration: InputDecoration(
          prefixIcon: Icon(icon, color: kPrimaryColor),
          suffixIcon: Icon(Icons.info, color: kPrimaryInfoIconColor),
          labelText: labelText,
          hintText:  hintText,
          helperText: helperText,
          filled: true,
          fillColor: Color(0xFFFFFFFF),
          border: OutlineInputBorder()
          ),
      )
      );
  }
}