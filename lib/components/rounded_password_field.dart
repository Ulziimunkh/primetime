import 'package:flutter/material.dart';
import 'package:primetime/constants/constants.dart';
import 'package:primetime/components/rounded_text_field_container.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    super.key, required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedTextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: AppLocalizations.of(context)!.password,
          icon: Icon(Icons.lock, color: kPrimaryColor,),
          suffixIcon: Icon(Icons.visibility, color: kPrimaryColor,),
          border: InputBorder.none
        ),
      ),
    );
  }
}