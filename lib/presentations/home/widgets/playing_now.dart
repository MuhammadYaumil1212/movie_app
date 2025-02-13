import 'package:day_watch/presentations/home/bloc/playing_now_cubit.dart';
import 'package:day_watch/core/widget/movie_card.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/config/assets/app_image.dart';
import '../../../core/config/theme/app_colors.dart';

class PlayingNow extends StatefulWidget {
  const PlayingNow({super.key});

  @override
  State<PlayingNow> createState() => _PlayingNowState();
}

class _PlayingNowState extends State<PlayingNow> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlayingNowCubit()..getPlayingNowMovies(),
      child: BlocBuilder<PlayingNowCubit, PlayingNowState>(
          builder: (context, state) {
        if (state is PlayingNowLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          );
        }
        if (state is PlayingNowLoaded) {
          return SizedBox(
            height: 300,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                return MovieCard(
                  movieEntity: state.movies[index],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemCount: state.movies.length,
            ),
          );
        }
        if (state is FailureLoad) {
          return Center(
            child: Text(
              state.errorMessage,
              style: TextStyle(color: AppColors.primary),
            ),
          );
        }
        return Container();
      }),
    );
  }
}
