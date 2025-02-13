import 'package:bloc/bloc.dart';
import 'package:day_watch/domain/movie/entities/movie_entity.dart';
import 'package:day_watch/domain/movie/usecases/get_trending_movies.dart';
import 'package:meta/meta.dart';

import '../../../service_locator.dart';

part 'trending_state.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit() : super(TrendingLoading());

  void getTrendingMovies() async {
    var moviesData = await sl<GetTrendingMoviesUsecase>().call();
    moviesData.fold(
      (error) {
        emit(FailureLoad(errorMessage: error));
      },
      (data) {
        emit(TrendingLoaded(movies: data));
      },
    );
  }
}
