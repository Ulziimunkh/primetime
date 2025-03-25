import 'package:flutter/material.dart';
import 'package:primetime/components/custom_table.dart';
import 'package:primetime/constants/constants.dart';
import 'package:primetime/components/rounded_button.dart';
import 'package:primetime/pages/Organization/components/org_pricetable.dart';
import 'package:primetime/pages/Resource/Room/rooms_page.dart';

class OfflineHoursPage extends StatefulWidget {
  const OfflineHoursPage({super.key});

  @override
  State<OfflineHoursPage> createState() => _OfflineHoursPageState();
}

class _OfflineHoursPageState extends State<OfflineHoursPage> {
  final List<List<String>> offlineHours = [];
 DateTime? _selectedDate = DateTime.now();
  void _addOfflineHour(String date, String startTime, String endTime, String comment) {
    setState(() {
      offlineHours.add([comment, date, startTime, endTime]);
    });
  }
  Future<void> _selectDate(BuildContext context, setState) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
       if (pickedDate != null && pickedDate != _selectedDate) {
        setState(() {
          _selectedDate = pickedDate;
             
        });
      }
  }

  void _showAddRecordPopup() {
    _selectedDate = _selectedDate ?? DateTime.now(); // Initially date is set to current date
    String selectedStartTime = '09:00'; // Default start time
    String selectedEndTime = '18:00'; // Default end time
    String comment = '';

    // Predefined time options
    final List<String> timeOptions = [
      '00:00', '01:00', '02:00', '03:00', '04:00', '05:00', '06:00', '07:00',
      '08:00', '09:00', '10:00', '11:00', '12:00', '13:00', '14:00', '15:00',
      '16:00', '17:00', '18:00', '19:00', '20:00', '21:00', '22:00', '23:00'
    ];

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Цаг нэмэх"),
          content:StatefulBuilder(
            builder: (context, setState){
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () => _selectDate(context, setState),
                            child: Text(
                              _selectedDate == null ? "Огноо сонгох" : _selectedDate.toString().split(' ')[0],
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Эхлэх цаг"),
                              DropdownButton<String>(
                                value: selectedStartTime,
                                isExpanded: true,
                                items: timeOptions.map((String time) {
                                  return DropdownMenuItem<String>(
                                    value: time,
                                    child: Text(time),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedStartTime = newValue!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Дуусах цаг"),
                              DropdownButton<String>(
                                value: selectedEndTime,
                                isExpanded: true,
                                items: timeOptions.map((String time) {
                                  return DropdownMenuItem<String>(
                                    value: time,
                                    child: Text(time),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedEndTime = newValue!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    TextField(
                      decoration: const InputDecoration(labelText: "Тайлбар"),
                      onChanged: (value) {
                        comment = value;
                      },
                    ),
                  ],
                ),
              );
            },
            ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Цуцлах"),
            ),
            TextButton(
              onPressed: () {
                if (_selectedDate != null &&
                    selectedStartTime.isNotEmpty &&
                    selectedEndTime.isNotEmpty) {
                  _addOfflineHour(_selectedDate.toString().split(' ')[0], selectedStartTime, selectedEndTime, comment);
                  Navigator.pop(context);
                }
              },
              child: const Text("Хадгалах"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Офлайн цагийн хуваарь",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: kPrimaryColor),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              SizedBox(height: size.height * 0.03),
            RoundedButton(
              text: "Шинэ цаг нэмэх",
              press: _showAddRecordPopup,
            ),
            SizedBox(height: size.height * 0.03),

            Expanded(
              child: CustomTable(
                columnHeaders: const ['Тайлбар', 'Огноо', 'Эхлэх цаг', 'Дуусах цаг'],
                rows: offlineHours,
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
                           Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const OrgPriceTable()),
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
    );
  }
}