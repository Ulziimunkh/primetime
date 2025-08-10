import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primetime/common/bloc/button/button_state.dart';
import 'package:primetime/common/bloc/button/button_state_cubit.dart';
import 'package:primetime/common/constants/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color, textColor;

  const RoundedButton({
    super.key,
    required this.text,
    required this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.8,
      child: BlocBuilder<ButtonStateCubit, ButtonState>(
        builder: (context, state) {
          if (state is ButtonLoadingState) {
            return _loading();
          }
          return _initial();
        },
      ),
    );
  }
  Widget _loading(){
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          disabledBackgroundColor: kSecondaryColor,
          disabledForegroundColor: Colors.white,
        ),
        onPressed: null,
        child: const CircularProgressIndicator()
      );
  }
  Widget _initial(){
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
        ),
        onPressed: press,
        child: Text(text, style: TextStyle(color: textColor)),
      );
  }
}