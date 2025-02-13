import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:day_watch/domain/movie/entities/movie_entity.dart';
import 'package:day_watch/domain/movie/entities/tv_entity.dart';
import 'package:day_watch/domain/movie/usecases/get_tv_popular_show.dart';
import 'package:meta/meta.dart';

import '../../../service_locator.dart';

part 'tv_popular_show_state.dart';

class TvPopularShowCubit extends Cubit<TvPopularShowState> {
  TvPopularShowCubit() : super(TvLoading());

  void getTvPopularShow() async {
    var tvPopularShow = await sl<GetTvPopularShow>().call();
    tvPopularShow.fold(
      (error) => emit(
        TvLoadingFailed(message: error),
      ),
      (data) => emit(
        TvLoaded(movies: data),
      ),
    );
  }
}
