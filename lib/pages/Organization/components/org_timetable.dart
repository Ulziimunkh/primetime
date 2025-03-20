import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:primetime/components/rounded_button.dart';
import 'package:primetime/constants/constants.dart';
import 'package:primetime/pages/Organization/components/offline_hours_page.dart';

class OrgTimeTable extends StatefulWidget {
  const OrgTimeTable({super.key});

  @override
  State<OrgTimeTable> createState() => _OrgTimeTableState();
}

class _OrgTimeTableState extends State<OrgTimeTable> {
  final _formKey = GlobalKey<FormState>();

  // Initialize opening and closing hours with default values
  final Map<String, String> openingHours = {
    'Даваа': '09:00',
    'Мягмар': '09:00',
    'Лхагва': '09:00',
    'Пүрэв': '09:00',
    'Баасан': '09:00',
    'Бямба': '10:00',
    'Ням': '10:00',
  };

  final Map<String, String> closingHours = {
    'Даваа': '18:00',
    'Мягмар': '18:00',
    'Лхагва': '18:00',
    'Пүрэв': '18:00',
    'Баасан': '18:00',
    'Бямба': '18:00',
    'Ням': '18:00',
  };

  final List<String> daysOfWeek = [
    'Даваа',
    'Мягмар',
    'Лхагва',
    'Пүрэв',
    'Баасан',
    'Бямба',
    'Ням',
  ];

  final List<String> hours = [
    '00:00',
    '01:00',
    '02:00',
    '03:00',
    '04:00',
    '05:00',
    '06:00',
    '07:00',
    '08:00',
    '09:00',
    '10:00',
    '11:00',
    '12:00',
    '13:00',
    '14:00',
    '15:00',
    '16:00',
    '17:00',
    '18:00',
    '19:00',
    '20:00',
    '21:00',
    '22:00',
    '23:00',
  ];

  @override
Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Scaffold(
    appBar: AppBar(
      title: Text(
        "Ажиллах цагийн хуваарь",
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  key: _formKey,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: constraints.maxWidth,
                      ),
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text('Гариг')),
                          DataColumn(label: Text('Нээх цаг')),
                          DataColumn(label: Text('Хаах цаг')),
                        ],
                        rows: daysOfWeek.map((day) {
                          return DataRow(cells: [
                            DataCell(Text(day, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),)),
                            DataCell(
                              DropdownButton<String>(
                                value: openingHours[day],
                                items: hours.map((String hour) {
                                  return DropdownMenuItem<String>(
                                    value: hour,
                                    child: Text(hour,style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    openingHours[day] = newValue!;
                                  });
                                },
                              ),
                            ),
                            DataCell(
                              DropdownButton<String>(
                                value: closingHours[day],
                                items: hours.map((String hour) {
                                  return DropdownMenuItem<String>(
                                    value: hour,
                                    child: Text(hour,style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    closingHours[day] = newValue!;
                                  });
                                },
                              ),
                            ),
                          ]);
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: RoundedButton(
                        text: "Дараагийн",
                        press: () {
                          if (_formKey.currentState!.validate()) {
                           Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const OfflineHoursPage()),
                                  );
                          }
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
          );
        },
      ),
    ),
  );
}
}