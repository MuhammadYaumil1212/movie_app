import 'package:day_watch/commons/widget/app_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../../commons/widget/app_button.dart';
import '../../../../commons/widget/app_textfield.dart';

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
            _buttonSignIn(),
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

  Widget _buttonSignIn() {
    return AppButton(
      onPressed: () {},
      textButton: "Sign Up",
    );
  }
}
