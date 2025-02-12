import 'package:day_watch/core/helper/message/message.dart';
import 'package:day_watch/core/helper/navigation/app_navigation.dart';
import 'package:day_watch/core/widget/app_scaffold.dart';
import 'package:day_watch/data/authentication/models/signupRequestParams.dart';
import 'package:day_watch/domain/authentication/usecases/signup.dart';
import 'package:day_watch/presentations/authentication/pages/signin/signin_screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/widget/app_button.dart';
import '../../../../core/widget/app_textfield.dart';
import '../../../../service_locator.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appWidget: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _signUpText(),
            const SizedBox(height: 30),
            _usernameTextfield(),
            const SizedBox(height: 30),
            _emailTextfield(),
            const SizedBox(height: 30),
            _passwordTextfield(),
            const SizedBox(height: 30),
            _confirmPasswordTextfield(),
            const SizedBox(height: 40),
            _buttonSignUp(),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  Widget _usernameTextfield() {
    return AppTextfield(
      controller: _usernameController,
      hintText: "Username",
    );
  }

  Widget _confirmPasswordTextfield() {
    return AppTextfield(
      controller: _confirmPasswordController,
      hintText: "Confirm Password",
      obscureText: true,
    );
  }

  Widget _signUpText() {
    return Text(
      'Sign up',
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

  Widget _buttonSignUp() {
    return AppButton(
      onPressed: () {
        _checkInput();
      },
      textButton: "Sign Up",
    );
  }

  void _checkInput() async {
    if (_passwordController.text == _confirmPasswordController.text) {
      final result = await sl<SignupUsecase>().call(
        params: SignupRequestParams(
          email: _emailController.text,
          password: _passwordController.text,
        ),
      );
      result.fold(
        (error) {
          DisplayMessage.errorMessage(error, context);
        },
        (data) {
          DisplayMessage.successMessage(
              "Success! Welcome to day watch", context);
          _usernameController.text = "";
          _emailController.text = "";
          _passwordController.text = "";
          _confirmPasswordController.text = "";
          AppNavigator.pushReplacement(context, SigninScreen());
        },
      );
    } else {
      DisplayMessage.errorMessage("Your password must be the same", context);
    }
  }
}
