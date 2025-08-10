import 'package:flutter/material.dart';
import 'package:primetime/common/constants/constants.dart';
import 'package:primetime/presentation/Login/pages/login_page.dart';
class Background extends StatelessWidget {
  final Widget child;
  const Background({
    super.key, required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset("assets/images/signup_top.png", width: size.width * 0.3,),
            ),
            Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset("assets/images/main_bottom.png", width: size.width * 0.25,),
            ),
            // Back Arrow Button
          Positioned(
  top: 50,
  left: 15,
  child: GestureDetector(
    onTap: () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    },
    child: Row(
      children: [
        const Icon(Icons.arrow_back_ios, size: 24, color: kPrimaryColor),
        const SizedBox(width: 4), // Spacing between icon and text
        const Text(
          "Буцах", // "Back" in Mongolian
          style: TextStyle(
            fontSize: 16,
            color: kPrimaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  ),
),
            child
        ],
      ),
    );
  }
}