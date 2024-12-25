import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:primetime/pages/Signup/signup_page.dart';
import 'package:primetime/pages/Welcome/components/background.dart'; 
import 'package:primetime/components/rounded_button.dart';
import 'package:primetime/constants/constants.dart';
import 'package:primetime/pages/Login/login_page.dart';
class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(AppLocalizations.of(context)!.welcome,
          style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SvgPicture.asset("assets/icons/chat.svg"),
          SizedBox(height: size.height * 0.03,),
          RoundedButton(
            text: AppLocalizations.of(context)!.sign,
            press: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            ),
          ),
           RoundedButton(
            text: AppLocalizations.of(context)!.signup,
            color: kPrimaryLightColor,
            textColor: Colors.black,
           press: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignupPage()),
            ),
          ),
        ],
            ),
      ));
  }
}



