import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:primetime/pages/Organization/components/background.dart';
import 'package:primetime/pages/Organization/components/org_contact_address.dart';
import 'package:primetime/pages/Organization/components/org_entry.dart';

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
          child: OrgEntry(),
        ),
      ),
      );
  }
}
