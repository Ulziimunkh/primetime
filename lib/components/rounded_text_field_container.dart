import 'package:flutter/material.dart';
import 'package:primetime/constants/constants.dart';

class RoundedTextFieldContainer extends StatelessWidget {
  final Widget child;
  const RoundedTextFieldContainer({
    super.key,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(29)
      ),
      child: child
    );
  }
}