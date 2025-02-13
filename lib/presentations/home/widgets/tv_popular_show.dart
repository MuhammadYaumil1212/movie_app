import 'package:day_watch/core/widget/tv_card.dart';
import 'package:day_watch/presentations/home/bloc/playing_now_cubit.dart';
import 'package:day_watch/presentations/home/bloc/tv_popular_show_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/config/theme/app_colors.dart';

class TvPopularShow extends StatefulWidget {
  const TvPopularShow({super.key});

  @override
  State<TvPopularShow> createState() => _PlayingNowState();
}

class _PlayingNowState extends State<TvPopularShow> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TvPopularShowCubit()..getTvPopularShow(),
      child: BlocBuilder<TvPopularShowCubit, TvPopularShowState>(
          builder: (context, state) {
        if (state is TvLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          );
        }
        if (state is TvLoaded) {
          return SizedBox(
            height: 500,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                return TvCard(
                  tvEntity: state.movies[index],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemCount: state.movies.length,
            ),
          );
        }
        if (state is TvLoadingFailed) {
          return Center(
            child: Text(
              state.message,
              style: TextStyle(color: AppColors.primary),
            ),
          );
        }
        return Container();
      }),
    );
  }
}
