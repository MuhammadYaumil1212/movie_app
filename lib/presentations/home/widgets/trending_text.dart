import 'package:flutter/material.dart';

class CatalogText extends StatelessWidget {
  final String title;
  const CatalogText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 24,
        ),
      ),
    );
  }
}
