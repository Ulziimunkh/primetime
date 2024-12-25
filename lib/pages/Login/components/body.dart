import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:primetime/components/rounded_button.dart';
import 'package:primetime/pages/Login/components/already_have_account.dart';
import 'package:primetime/pages/Login/components/background.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primetime/pages/Login/components/rounded_input_field.dart';
import 'package:primetime/pages/Login/components/rounded_password_field.dart';
import 'package:primetime/pages/Signup/signup_page.dart';
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
            Text(AppLocalizations.of(context)!.sign, style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: size.height * 0.03,),
            SvgPicture.asset("assets/icons/login.svg", height: size.height * 0.35,),
            RoundedInputField(
              hintText: "Утасны дугаар", 
              icon: Icons.phone, 
              onChanged: (value){}
              ),
              RoundedPasswordField(
                onChanged: (value){},
              ),
              RoundedButton(text: AppLocalizations.of(context)!.sign, press: (){}),
              SizedBox(height: size.height * 0.03,),
              AlreadyHaveAccountCheck(press: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) { 
                    return SignupPage();
                    },)
                    );
                    }),
          ],
        ),
      ),);
  }
}



