import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:primetime/components/squared_input_field.dart';
import 'package:primetime/components/rounded_button.dart';
import 'package:primetime/constants/constants.dart';
import 'package:primetime/models/district.dart';
import 'package:primetime/models/khoroo.dart';
import 'package:primetime/pages/Organization/components/org_entry.dart';
import 'package:primetime/pages/Organization/components/org_timetable.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Холбоо барих",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: kPrimaryColor),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: SvgPicture.asset(
                      "assets/icons/signup.svg",
                      height: constraints.maxWidth > 600 ? size.height * 0.2 : size.height * 0.15,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Form(
                    child: Column(
                      children: [
                        SquaredInputField(
                          labelText: "Утас 1",
                          hintText: "Утасны дугаар оруулна уу",
                          helperText: "Утасны дугаар оруулна уу",
                          textInputType: TextInputType.phone,
                          icon: Icons.phone_iphone_rounded,
                          maxLength: 8,
                          onChanged: (value) {},
                        ),
                        SquaredInputField(
                          labelText: "Утас 2",
                          hintText: "Утасны дугаар оруулна уу",
                          helperText: "Утасны дугаар оруулна уу",
                          textInputType: TextInputType.phone,
                          icon: Icons.phone_iphone_rounded,
                          maxLength: 8,
                          onChanged: (value) {},
                        ),
                        SizedBox(height: size.height * 0.02),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                          width: constraints.maxWidth > 600 ? size.width * 0.6 : size.width * 0.9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<District>(
                              isExpanded: true,
                              hint: const Row(
                                children: [
                                  Icon(Icons.location_city, color: kPrimaryColor),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      'Дүүрэг сонгоно уу',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                              items: District.values
                                  .map((District entry) => DropdownMenuItem<District>(
                                        value: entry,
                                        child: Text(entry.name),
                                      ))
                                  .toList(),
                              value: selectedDistrict,
                              onChanged: (entry) {
                                setState(() {
                                  selectedDistrict = entry;
                                  selectedKhoroo = null;
                                  khorooController.clear();
                                });
                              },
                              buttonStyleData: ButtonStyleData(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.grey),
                                  color: Colors.white,
                                ),
                                width: 140,
                                height: 50,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                          width: constraints.maxWidth > 600 ? size.width * 0.6 : size.width * 0.9,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<Khoroo>(
                              isExpanded: true,
                              hint: const Row(
                                children: [
                                  Icon(Icons.location_pin, color: kPrimaryColor),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      'Хороо сонгоно уу',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                              items: selectedDistrict != null
                                  ? Khoroo.districtKhorooMap[selectedDistrict!]!
                                      .map((Khoroo entry) => DropdownMenuItem<Khoroo>(
                                            value: entry,
                                            child: Text(entry.name),
                                          ))
                                      .toList()
                                  : [],
                              value: selectedKhoroo,
                              onChanged: (entry) {
                                setState(() {
                                  selectedKhoroo = entry;
                                });
                              },
                              buttonStyleData: ButtonStyleData(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.grey),
                                  color: Colors.white,
                                ),
                                width: 140,
                                height: 50,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),
                        SquaredInputField(
                          labelText: "Хаяг",
                          hintText: "Хаяг оруулна уу",
                          icon: Icons.edit_location,
                          onChanged: (value) {},
                        ),
                        SizedBox(height: size.height * 0.03),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: RoundedButton(
                                text: "Дараагийн",
                                press: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const OrgTimeTable()),
                                  );
                                },
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: RoundedButton(
                                text: "Буцах",
                                press: () => Navigator.pop(context),
                                color: kSecondaryColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}