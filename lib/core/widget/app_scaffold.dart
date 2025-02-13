import 'package:flutter/material.dart';

class AppScaffold extends StatefulWidget {
  final Widget appWidget;
  final PreferredSizeWidget? appBar;
  const AppScaffold({super.key, required this.appWidget, this.appBar});

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      body: SafeArea(
        child: widget.appWidget,
      ),
    );
  }
}
