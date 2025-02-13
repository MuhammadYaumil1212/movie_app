import 'package:dartz/dartz.dart';
import 'package:day_watch/core/helper/mapper/movie_mapper.dart';
import 'package:day_watch/core/helper/mapper/tv_mapper.dart';
import 'package:day_watch/data/movie/models/movie_model.dart';
import 'package:day_watch/data/movie/models/tv_model.dart';
import 'package:day_watch/data/movie/source/movie_service.dart';
import 'package:day_watch/domain/movie/repositories/movie.dart';

import '../../../service_locator.dart';

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<Either> getTrendingMovies() async {
    // TODO: implement getTrendingMovies
    var trendingData = await sl<MovieService>().getTrendingMovies();
    return trendingData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        final movieList = List.from(data['content'])
            .map(
              (item) => MovieMapper.toEntity(
                MovieModel.fromJson(item),
              ),
            )
            .toList();
        return Right(movieList);
      },
    );
  }

  @override
  Future<Either> getPlayingNow() async {
    // TODO: implement getPlayingNow
    var playingNow = await sl<MovieService>().getPlayingNow();
    return playingNow.fold(
      (error) {
        return Left(error);
      },
      (data) {
        final listPlayingNow = List.from(data['content'])
            .map(
              (item) => MovieMapper.toEntity(
                MovieModel.fromJson(item),
              ),
            )
            .toList();
        return Right(listPlayingNow);
      },
    );
  }

  @override
  Future<Either> getTvShow() async {
    // TODO: implement getTvShow
    var getTvShow = await sl<MovieService>().getTvShow();
    return getTvShow.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var tvShow = List.from(data['content'])
            .map(
              (item) => TvMapper.toEntity(
                TvModel.fromJson(item),
              ),
            )
            .toList();
        return Right(tvShow);
      },
    );
  }
}
