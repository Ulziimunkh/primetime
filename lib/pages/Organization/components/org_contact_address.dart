import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:primetime/components/squared_input_field.dart';
import 'package:primetime/components/rounded_button.dart';
import 'package:primetime/constants/constants.dart';
import 'package:primetime/models/busines_type.dart';
import 'package:primetime/models/district.dart';
import 'package:primetime/models/khoroo.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primetime/pages/Organization/components/org_entry.dart';
class OrgContactAddress extends StatefulWidget {
  const OrgContactAddress({super.key});

  @override
  State<OrgContactAddress> createState() => _OrgContactAddresstate();
}

class _OrgContactAddresstate extends State<OrgContactAddress> {
   District? selectedDistrict;
   Khoroo? selectedKhoroo;
   final TextEditingController districtController = TextEditingController();
   final TextEditingController khorooController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.02,),
            Text("Хаяг болон холбоо барих мэдээлэл",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28,color: kPrimaryColor),),
          SvgPicture.asset("assets/icons/signup.svg", height: size.height * 0.2, fit: BoxFit.scaleDown,
            ),
            SizedBox(height: size.height * 0.02,),
              Form(
                child: Column(
                  children: [
                    SquaredInputField(
                        labelText: "Утас 1", 
                        hintText: "Утасны дугаар оруулна уу", 
                        icon: Icons.phone_iphone_rounded, 
                        textInputType: TextInputType.phone,
                        maxLength: 8,
                        onChanged: (value){}
                        ),
                    SquaredInputField(
                        labelText: "Утас 2", 
                        hintText: "Утасны дугаар оруулна уу", 
                        icon: Icons.phone_iphone_rounded, 
                        maxLength: 8,
                        textInputType: TextInputType.phone,
                        onChanged: (value){}
                        ),
                    Container(
                          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                          width: size.width * 0.9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: DropdownMenu(
                            label: const Text('Дүүрэг'),
                            controller: districtController,
                            //helperText: 'Дүүрэг сонгоно уу',
                            width: size.width,
                            enableFilter: true,
                            leadingIcon:  const Icon(Icons.home, color: kPrimaryColor,),
                            requestFocusOnTap: true,
                            onSelected: (District? district){
                              setState(() {
                                selectedDistrict = district;
                                selectedKhoroo = null;
                                khorooController.clear();
                              });
                            },
                            dropdownMenuEntries: District.entries),
                          
                        ),
                    
                    SizedBox(height: size.height * 0.02 ,),
                    Container(
                          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                          width: size.width * 0.9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: DropdownMenu(
                            label: const Text('Хороо'),
                            controller: khorooController,
                            width: size.width,
                            enableFilter: true,
                            leadingIcon:  const Icon(Icons.home, color: kPrimaryColor,),
                            requestFocusOnTap: true,
                            
                            dropdownMenuEntries: selectedDistrict != null ? Khoroo.getEntries(Khoroo.districtKhorooMap[selectedDistrict]!) : [],
                            ),
                          
                        ),
                    SizedBox(height: size.height * 0.02 ,),
                    SquaredInputField(
                        labelText: "Хаяг", 
                        hintText: "Хаяг оруулна уу", 
                        icon: Icons.edit_location,
                        onChanged: (value){}
                        ),
                    SizedBox(height: size.height * 0.03,),
                     RoundedButton(text: "Дараагийн", press: (){}),
                     RoundedButton(text: "Буцах", press: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const OrgEntry()),
            ),color: kSecondaryColor,),
                        
                    
                  ],
                ))
          ],
          ),
        );
      
  }
}