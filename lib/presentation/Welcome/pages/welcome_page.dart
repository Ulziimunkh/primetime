import 'package:flutter/material.dart';
import 'package:primetime/presentation/Welcome/components/body.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}