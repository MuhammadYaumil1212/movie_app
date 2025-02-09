import 'package:day_watch/commons/helper/navigation/app_navigation.dart';
import 'package:day_watch/commons/widget/app_button.dart';
import 'package:day_watch/commons/widget/app_scaffold.dart';
import 'package:day_watch/commons/widget/app_textfield.dart';
import 'package:day_watch/presentations/authenticated/pages/signup/signup_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
          _buttonSignIn(),
          const SizedBox(height: 15),
          _signUpText()
        ],
      ),
    );
  }

  Widget? _checkInput() {
    if (_emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Email is empty"),
        ),
      );
    }
    if (_passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Password is empty"),
        ),
      );
    }
    return null;
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

  Widget _buttonSignIn() {
    return AppButton(
      onPressed: () {
        _checkInput();
      },
      textButton: "Sign In",
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
