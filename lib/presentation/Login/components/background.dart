import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primetime/common/bloc/button/button_state_cubit.dart';
import 'package:primetime/common/constants/constants.dart';
import 'package:primetime/presentation/Home/pages/home_page.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => ButtonStateCubit(),
        child: SizedBox(
          width: double.infinity,
          height: size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Image.asset(
                  "assets/images/main_top.png",
                  width: size.width * 0.35,
                ),
              ),
             
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  "assets/images/login_bottom.png",
                  width: size.width * 0.4,
                ),
              ),
              // Back Arrow Button
              Positioned(
          top: 50,
          left: 15,
          child: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        },
        child: Row(
          children: [
            const Icon(Icons.arrow_back_ios, size: 24, color: kPrimaryColor),
            const SizedBox(width: 4), // Spacing between icon and text
            const Text(
              "Нүүр", // "Back" in Mongolian
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
              child,
            ],
          ),
      ),
    );
  }
}