import 'package:flutter/material.dart';

class TrendingText extends StatelessWidget {
  const TrendingText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Trendings 🔥",
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 24,
      ),
    );
  }
}
