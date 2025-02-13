import 'package:day_watch/core/config/assets/app_image.dart';
import 'package:day_watch/core/config/theme/app_colors.dart';
import 'package:day_watch/presentations/home/bloc/trending_cubit.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrendingCubit()..getTrendingMovies(),
      child:
          BlocBuilder<TrendingCubit, TrendingState>(builder: (context, state) {
        if (state is TrendingLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          );
        }
        if (state is TrendingLoaded) {
          return FanCarouselImageSlider.sliderType1(
            imagesLink: state.movies
                .map((item) =>
                    AppImage.movieImageBasePath + item.posterPath.toString())
                .toList(),
            isAssets: false,
            autoPlay: true,
            sliderHeight: 400,
            showIndicator: true,
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
