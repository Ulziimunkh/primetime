import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:primetime/components/squared_input_field.dart';
import 'package:primetime/components/rounded_button.dart';
import 'package:primetime/constants/constants.dart';
import 'package:primetime/models/busines_type.dart';
import 'package:primetime/models/district.dart';
import 'package:primetime/models/khoroo.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primetime/pages/Organization/components/org_contact_address.dart';
import 'package:primetime/pages/Signup/signup_page.dart';
class OrgEntry extends StatefulWidget {
  const OrgEntry({super.key});

  @override
  State<OrgEntry> createState() => _OrgEntryState();
}

class _OrgEntryState extends State<OrgEntry> {
   District? selectedDistrict;
   Khoroo? selectedKhoroo;
   final TextEditingController districtController = TextEditingController();
   final TextEditingController khorooController = TextEditingController();

  void _showDialog(Widget child){
    showCupertinoModalPopup(context: context, builder: (BuildContext context) => Container(
      height: 216,
      padding: const EdgeInsets.only(top: 6.0),
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      color: CupertinoColors.systemBackground.resolveFrom(context),
      child: SafeArea(top: false, child: child),
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return 
    Scaffold(
      appBar: AppBar(
        title: Text("Бизнес бүртгэл",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22,color: kPrimaryColor),),
      backgroundColor: Colors.white,),
       resizeToAvoidBottomInset: true,
    body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          SvgPicture.asset("assets/icons/signup.svg", height: size.height * 0.2, fit: BoxFit.scaleDown,
            ),
            SizedBox(height: size.height * 0.02,),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SquaredInputField(
                        labelText: "Бизнес нэр", 
                        hintText: "Бизнес нэр оруулна уу", 
                        icon: Icons.business_rounded, 
                        onChanged: (value){}
                        ),
                    Container(
                          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                          width: size.width * 0.9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          child: DropdownMenu(
                            label: const Text('Үйл ажиллагааны чиглэл'),
                            //helperText: 'Үйл ажиллагааны чиглэл сонгоно уу',
                            width: size.width,
                            
                            leadingIcon:  const Icon(Icons.ac_unit_sharp, color: kPrimaryColor,),
                            requestFocusOnTap: true,
                            onSelected: (BusinessType? businesType){
                              setState(() {
                              });
                            },
                            dropdownMenuEntries: BusinessType.entries),
                          
                        ),
                    SizedBox(height: size.height * 0.02 ,),
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
                    SizedBox(height: size.height * 0.03,),
                                          Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: RoundedButton(
                              text: "Дараагийн",
                              press: () => Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const OrgContactAddress()),
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: RoundedButton(
                              text: "Болих",
                              press: () {},
                              color: kSecondaryColor,
                            ),
                          ),
                        ],
                      ),
                  ],
                ))
          ],
          ),
        ),
    );
  }
}