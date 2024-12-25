import 'package:flutter/material.dart';
import 'package:primetime/constants/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class AlreadyHaveAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAccountCheck({
    super.key, this.login = true, required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(login ? AppLocalizations.of(context)!.dontHaveanAccount : AppLocalizations.of(context)!.alreadyHaveAnAccount,
        style: TextStyle(color: kPrimaryColor)),
        GestureDetector(
          onTap: () => press(),
          child: Text(login ? AppLocalizations.of(context)!.signup : AppLocalizations.of(context)!.sign, 
          style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}

