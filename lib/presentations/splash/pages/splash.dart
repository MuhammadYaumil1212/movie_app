import 'package:day_watch/commons/helper/navigation/app_navigation.dart';
import 'package:day_watch/core/config/assets/app_image.dart';
import 'package:day_watch/presentations/authenticated/pages/signin/signin_screen.dart';
import 'package:day_watch/presentations/home/pages/home_screen.dart';
import 'package:day_watch/presentations/splash/bloc/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          AppNavigator.pushReplacement(
            context,
            SigninScreen(),
          );
        }
        if (state is Authenticated) {
          AppNavigator.pushReplacement(
            context,
            HomeScreen(),
          );
        }
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                AppImage.splashBackground,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
