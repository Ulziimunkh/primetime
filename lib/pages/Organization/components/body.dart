import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:primetime/components/rounded_button.dart';
import 'package:primetime/components/squared_input_field.dart';
import 'package:primetime/pages/Organization/components/background.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
   Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Бизнес бүртгэл",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),),
SvgPicture.asset("assets/icons/signup.svg", height: size.height * 0.2, fit: BoxFit.scaleDown,
          ),
          SizedBox(height: size.height * 0.02,),      
  
            Form(
              child: Column(
                children: [
                   SquaredInputField(
                      labelText: "Бизнес нэр", 
                      hintText: "Бизнес нэр оруулна уу", 
                      icon: Icons.business_rounded, 
                      onChanged: (value){}
                      ),
                  SquaredInputField(
                      labelText: "Салбар нэр", 
                      hintText: "Салбар нэр оруулна уу", 
                      icon: Icons.device_hub_rounded,
                      onChanged: (value){}
                      ),
                                         SquaredInputField(
                      labelText: "Имейл", 
                      hintText: "И-мейл оруулна уу", 
                      icon: Icons.email_rounded,
                      textInputType: TextInputType.emailAddress,
                      onChanged: (value){}
                      ),
                                         SquaredInputField(
                      labelText: "Утас 1", 
                      hintText: "Утасны дугаар оруулна уу", 
                      icon: Icons.phone_iphone_rounded, 
                      textInputType: TextInputType.phone,
                      onChanged: (value){}
                      ),
                  SquaredInputField(
                      labelText: "Утас 2", 
                      hintText: "Утасны дугаар оруулна уу", 
                      icon: Icons.phone_iphone_rounded, 
                      textInputType: TextInputType.phone,
                      onChanged: (value){}
                      ),
                    SizedBox(height: size.height * 0.03,),
                    RoundedButton(text: AppLocalizations.of(context)!.signup, press: (){}),
                ],
              ))
        ],
            ),
      ),);
  }
}
