import 'package:flutter/material.dart';
import 'package:primetime/pages/Organization/components/background.dart';
import 'package:primetime/pages/Resource/Room/components/room_entry.dart';
import 'package:primetime/pages/Resource/Room/rooms_page.dart';

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
      child: Container(
          constraints: BoxConstraints(
            maxHeight: size.height,
          ),
          child: RoomsPage(),
        ),
      ),
      );
  }
}
