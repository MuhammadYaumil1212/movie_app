import 'package:day_watch/core/config/assets/app_vectors.dart';
import 'package:day_watch/core/widget/app_bar.dart';
import 'package:day_watch/core/widget/app_scaffold.dart';
import 'package:day_watch/presentations/home/widgets/playing_now.dart';
import 'package:day_watch/presentations/home/widgets/trending.dart';
import 'package:day_watch/presentations/home/widgets/trending_text.dart';
import 'package:day_watch/presentations/home/widgets/tv_popular_show.dart';
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
          width: 100.0,
          height: 100.0,
        ),
        action: Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Icon(
            Icons.person_outline,
            size: 30,
          ),
        ),
      ),
      appWidget: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CatalogText(title: "Trendings 🔥"),
            TrendingMovies(),
            CatalogText(title: "Playing Now"),
            PlayingNow(),
            CatalogText(title: "Tv Popular Show"),
            TvPopularShow()
          ],
        ),
      ),
    );
  }
}
