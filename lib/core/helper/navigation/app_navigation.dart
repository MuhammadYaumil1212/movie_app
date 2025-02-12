import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppNavigator {
  static void pushReplacement(BuildContext context, Widget widget) {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 600),
        pageBuilder: (context, animation, secondaryAnimation) => widget,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  static void push(BuildContext context, Widget widget) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 600),
        pageBuilder: (context, animation, secondaryAnimation) => widget,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  static void pushAndRemove(BuildContext context, Widget widget) {
    Navigator.of(context).pushAndRemoveUntil(
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 600),
        pageBuilder: (context, animation, secondaryAnimation) => widget,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
      (Route<dynamic> route) => false,
    );
  }
}
