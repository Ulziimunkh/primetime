import 'package:flutter/material.dart';
import 'package:primetime/constants/constants.dart';
import 'package:primetime/pages/Login/components/text_field_container.dart';
class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    super.key, required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: "Нууц үг",
          icon: Icon(Icons.lock, color: kPrimaryColor,),
          suffixIcon: Icon(Icons.visibility, color: kPrimaryColor,),
          border: InputBorder.none
        ),
      ),
    );
  }
}