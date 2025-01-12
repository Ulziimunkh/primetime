import 'package:flutter/material.dart';
import 'package:primetime/constants/constants.dart';
import 'package:primetime/components/rounded_text_field_container.dart';
class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    super.key, required this.hintText, this.icon = Icons.phone, required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedTextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,),
          hintText:  hintText,
          border: InputBorder.none
          ),
      )
      );
  }
}