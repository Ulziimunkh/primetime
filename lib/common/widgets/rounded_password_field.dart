import 'package:flutter/material.dart';
import 'package:primetime/common/constants/constants.dart';
import 'package:primetime/common/widgets/rounded_text_field_container.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController? controller;
  final String? hintText;

  const RoundedPasswordField({
    super.key,
    this.hintText,
    required this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedTextFieldContainer(
      child: TextField(
        obscureText: true,
        controller: controller ?? TextEditingController(),
        onChanged: onChanged,
        decoration: InputDecoration(
            hintText: hintText ?? AppLocalizations.of(context).password,
            icon: Icon(
              Icons.lock,
              color: kPrimaryColor,
            ),
            suffixIcon: Icon(
              Icons.visibility,
              color: kPrimaryColor,
            ),
            border: InputBorder.none),
      ),
    );
  }
}
