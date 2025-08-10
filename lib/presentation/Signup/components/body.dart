import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:primetime/common/bloc/button/button_state.dart';
import 'package:primetime/common/bloc/button/button_state_cubit.dart';
import 'package:primetime/common/widgets/rounded_button.dart';
import 'package:primetime/data/models/signup_req_params.dart';
import 'package:primetime/domain/usecases/signup.dart';
import 'package:primetime/presentation/Home/pages/home_page.dart';
import 'package:primetime/presentation/Login/components/already_have_account.dart';
import 'package:primetime/common/widgets/rounded_input_field.dart';
import 'package:primetime/common/widgets/rounded_password_field.dart';
import 'package:primetime/presentation/Login/pages/login_page.dart';
import 'package:primetime/presentation/Signup/components/background.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primetime/presentation/Signup/components/or_divider.dart';
import 'package:primetime/presentation/Signup/components/social_icon.dart';
import 'package:primetime/service_locator.dart';

class Body extends StatelessWidget {
  Body({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ScaffoldMessenger(
      key: scaffoldMessengerKey,
      child: Scaffold(
        body: Builder(builder: (context) {
          return Background(
            child: BlocProvider(
              create: (context) => ButtonStateCubit(),
              child: BlocListener<ButtonStateCubit, ButtonState>(
                listener: (context, state) {
                  if (state is ButtonSuccessState) {
                    // Handle success state
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  } else if (state is ButtonFailureState) {
                    // Handle error state
                    _showNotification(state.errorMessage);
                  }
                },
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context).signup,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      SvgPicture.asset(
                        "assets/icons/signup.svg",
                        height: size.height * 0.35,
                      ),
                      RoundedInputField(
                          hintText: AppLocalizations.of(context).email,
                          icon: Icons.person,
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {}),
                      RoundedPasswordField(
                        onChanged: (value) {},
                        hintText: AppLocalizations.of(context).password,
                        controller: passwordController,
                      ),
                      _signupButton(context),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      AlreadyHaveAccountCheck(
                          login: false,
                          press: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return LoginPage();
                              },
                            ));
                          }),
                      OrDivider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocialIcon(
                            iconSrc: "assets/icons/facebook.svg",
                            press: () {},
                          ),
                          SocialIcon(
                            iconSrc: "assets/icons/twitter.svg",
                            press: () {},
                          ),
                          SocialIcon(
                            iconSrc: "assets/icons/google-plus.svg",
                            press: () {},
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  void _showNotification(String message) {
    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.pinkAccent.shade400,
      ),
    );
  }

  Widget _signupButton(BuildContext context) {
    return Builder(
      builder: (context) {
        return RoundedButton(
          text: AppLocalizations.of(context).signup,
          press: () {
            final email = emailController.text.trim();
            final password = passwordController.text.trim();

            // Validate email and password
            if (email.isEmpty || password.isEmpty) {
              _showNotification(
                  "${AppLocalizations.of(context).email} болон ${AppLocalizations.of(context).password} талбаруудыг бөглөнө үү.");
              return;
            }

            // Validate email format
            final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
            if (!emailRegex.hasMatch(email)) {
              _showNotification(
                  "Таны оруулсан ${AppLocalizations.of(context).email} хаяг шаардлага хангахгүй байна.Та зөв имэйл хаяг оруулна уу.");
              return;
            }

            // Validate password length
            if (password.length < 6) {
              _showNotification(
                  "${AppLocalizations.of(context).password} must be at least 6 characters");
              return;
            }

            // If validation passes, execute the signup use case
            context.read<ButtonStateCubit>().execute(
                  usecase: sl<SignupUseCase>(),
                  params: SignupReqParams(
                    email: email,
                    password: password,
                  ),
                );
          },
        );
      },
    );
  }
}
