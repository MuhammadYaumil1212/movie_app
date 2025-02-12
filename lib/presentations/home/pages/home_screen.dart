import 'package:day_watch/core/constants/string.dart';
import 'package:day_watch/core/helper/navigation/app_navigation.dart';
import 'package:day_watch/core/helper/storage/AppStorage.dart';
import 'package:day_watch/core/widget/reactive_button/app_button.dart';
import 'package:day_watch/presentations/authentication/pages/signin/signin_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text("Home Screen"),
            const Spacer(),
            AppButton(
              title: "Logout",
              onPressed: () async {
                final storage = AppStorage.instance;
                storage.delete(AppString.TOKEN_KEY);
                AppNavigator.pushAndRemove(context, SigninScreen());
              },
              onSuccess: () {},
              onFailure: (String error) {},
            ),
            const SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
