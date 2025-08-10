import 'package:flutter/material.dart';
import 'package:primetime/common/constants/constants.dart';
import 'package:primetime/common/widgets/rounded_text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextInputType? keyboardType;
  final ValueChanged<String> onChanged;
  final TextEditingController? controller;
  const RoundedInputField({
    super.key,
    required this.hintText,
    this.icon = Icons.phone,
    this.controller,
    this.keyboardType = TextInputType.text,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedTextFieldContainer(
        child: TextField(
      onChanged: onChanged,
      controller: controller ?? TextEditingController(),
      keyboardType: keyboardType,
      decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none),
    ));
  }
}
