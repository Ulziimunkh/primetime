import 'package:flutter/material.dart';
import 'package:primetime/constants/constants.dart';

class SquaredTextFieldContainer extends StatelessWidget {
  final Widget child;
  const SquaredTextFieldContainer({
    super.key,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
      width: size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15)
      ),
      child: child
    );
  }
}