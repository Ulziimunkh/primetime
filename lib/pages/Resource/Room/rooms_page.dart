import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:primetime/components/custom_table.dart';
import 'package:primetime/constants/constants.dart';
import 'package:primetime/pages/Resource/Room/components/background.dart';
import 'package:primetime/components/rounded_button.dart'; // Ensure this is the correct path to the RoundedButton widget
import 'package:flutter_svg/flutter_svg.dart';
import 'package:primetime/pages/Resource/Room/components/room_entry.dart';

class RoomsPage extends StatefulWidget {
  const RoomsPage({super.key});

  @override
  State<RoomsPage> createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  final List<Map<String, String>> rooms = []; // List to store room data

  void _addRoom() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RoomEntry()),
    );

    if (result != null && result is Map<String, String>) {
      setState(() {
        rooms.add(result); // Add the new room to the list
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Өрөөний жагсаалт",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
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
                      "assets/icons/login.svg",
                      height: constraints.maxWidth > 600
                          ? size.height * 0.2
                          : size.height * 0.15,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  RoundedButton(
                    text: "Өрөө нэмэх",
                    press: _addRoom, // Call the _addRoom method
                  ),
                  const SizedBox(height: 16),
                  CustomTable(
                    columnHeaders: ['№', 'Өрөөний нэр', 'VIP', 'Үнэ', 'Багтаамж', 'Нэмэлт мэдээлэл', 'Зураг'],
                    rows: rooms.map((room) {
                      return [
                        room['roomno']!,
                        room['roomno']!,
                        room['vip']!,
                        room['price']!,
                        room['capacity']!,
                        room['additionalinfo']!,
                        room['photos']!,
                      ];
                    }).toList(),
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