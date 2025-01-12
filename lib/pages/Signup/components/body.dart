import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:primetime/components/rounded_button.dart';
import 'package:primetime/pages/Login/components/already_have_account.dart';
import 'package:primetime/components/rounded_input_field.dart';
import 'package:primetime/components/rounded_password_field.dart';
import 'package:primetime/pages/Login/login_page.dart';
import 'package:primetime/pages/Signup/components/background.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primetime/pages/Signup/components/or_divider.dart';
import 'package:primetime/pages/Signup/components/social_icon.dart';
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
          Text(AppLocalizations.of(context)!.signup,
          style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(height: size.height * 0.03,),
          SvgPicture.asset("assets/icons/signup.svg",
          height: size.height * 0.35,),
          RoundedInputField(hintText: AppLocalizations.of(context)!.phoneNumber, onChanged: (value){}),
          RoundedPasswordField(onChanged: (value){}),
          RoundedButton(text: AppLocalizations.of(context)!.signup, press: (){}),
          SizedBox(height: size.height * 0.03,),
          AlreadyHaveAccountCheck( login:false, press: (){
               Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) { 
                    return LoginPage();
                    },)
                    );
          }),
          OrDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialIcon(iconSrc: "assets/icons/facebook.svg", press: (){},),
              SocialIcon(iconSrc: "assets/icons/twitter.svg", press: (){},),
              SocialIcon(iconSrc: "assets/icons/google-plus.svg", press: (){},),
            ],
          )
        ],
            ),
      ),);
  }
}
