import 'package:bloc/bloc.dart';
import 'package:day_watch/domain/movie/usecases/get_playing_now_movie.dart';
import 'package:meta/meta.dart';

import '../../../domain/movie/entities/movie_entity.dart';
import '../../../service_locator.dart';

part 'playing_now_state.dart';

class PlayingNowCubit extends Cubit<PlayingNowState> {
  PlayingNowCubit() : super(PlayingNowLoading());

  void getPlayingNowMovies() async {
    var moviesData = await sl<GetPlayingNowMovie>().call();
    moviesData.fold(
      (error) {
        emit(FailureLoad(errorMessage: error));
      },
      (data) {
        emit(PlayingNowLoaded(movies: data));
      },
    );
  }
}
