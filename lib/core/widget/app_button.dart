import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String textButton;
  const AppButton({
    super.key,
    required this.onPressed,
    required this.textButton,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            widget.textButton,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
