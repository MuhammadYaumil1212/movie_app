import 'package:day_watch/core/helper/message/message.dart';
import 'package:day_watch/core/helper/navigation/app_navigation.dart';
import 'package:day_watch/core/widget/app_scaffold.dart';
import 'package:day_watch/core/widget/app_textfield.dart';
import 'package:day_watch/data/authentication/models/signinRequestParams.dart';
import 'package:day_watch/domain/authentication/usecases/signin.dart';
import 'package:day_watch/presentations/authentication/pages/signup/signup_screen.dart';
import 'package:day_watch/presentations/home/pages/home_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/widget/reactive_button/app_button.dart';
import '../../../../service_locator.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      appWidget: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _signInText(),
          const SizedBox(height: 30),
          _emailTextfield(),
          const SizedBox(height: 20),
          _passwordTextfield(),
          const SizedBox(height: 40),
          _buttonSignIn(context),
          const SizedBox(height: 15),
          _signUpText()
        ],
      ),
    );
  }

  Widget _signInText() {
    return Text(
      'Sign in',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }

  Widget _emailTextfield() {
    return AppTextfield(
      controller: _emailController,
      hintText: "Email",
    );
  }

  Widget _passwordTextfield() {
    return AppTextfield(
      controller: _passwordController,
      hintText: "Password",
      obscureText: true,
    );
  }

  Widget _buttonSignIn(BuildContext context) {
    return AppButton(
      onPressed: () async {
        await sl<SigninUsecase>().call(
          params: SigninrequestParams(
            email: _emailController.text,
            password: _passwordController.text,
          ),
        );
        AppNavigator.pushReplacement(context, HomeScreen());
      },
      title: "Sign In",
      onSuccess: () async {
        DisplayMessage.successMessage("Welcome Back! ", context);
      },
      onFailure: (String error) {
        DisplayMessage.errorMessage(error, context);
      },
    );
  }

  Widget _signUpText() {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: "Not registered yet ? "),
          TextSpan(
            text: "Sign up here",
            style: TextStyle(color: Colors.blueAccent),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(context, SignupScreen());
              },
          ),
        ],
      ),
    );
  }
}
