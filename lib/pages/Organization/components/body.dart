import 'package:flutter/material.dart';
import 'package:primetime/pages/Organization/components/background.dart';

import 'package:primetime/components/rounded_button.dart';
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
          SizedBox(height: size.height * 0.03,),      
            Form(
              child: Column(
                children: [
                  TextFormField(decoration: InputDecoration(
                    labelText: "Бизнес нэр",),
                    ),
                  TextFormField(decoration: InputDecoration(
                    labelText: "Салбар нэр",),
                    ),
                  TextFormField(decoration: InputDecoration(
                    labelText: "Имейл",),
                    ),
                    TextFormField(decoration: InputDecoration(
                    labelText: "Утас 1",),
                    ),                  
                    TextFormField(decoration: InputDecoration(
                    labelText: "Утас 2",),
                    ),
                    SizedBox(height: size.height * 0.03,),
                ],
              ))
        ],
            ),
      ),);
  }
}
