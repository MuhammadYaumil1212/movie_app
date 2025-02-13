import 'package:day_watch/core/config/assets/app_vectors.dart';
import 'package:day_watch/core/widget/app_bar.dart';
import 'package:day_watch/core/widget/app_scaffold.dart';
import 'package:day_watch/presentations/widgets/trending.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: BasicAppbar(
        hideback: true,
        title: SvgPicture.asset(
          AppVectors.logo,
          width: 150.0,
          height: 150.0,
        ),
        action: Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Icon(
            Icons.person_outline,
            size: 30,
          ),
        ),
      ),
      appWidget: Column(
        children: [TrendingMovies()],
      ),
    );
  }
}
