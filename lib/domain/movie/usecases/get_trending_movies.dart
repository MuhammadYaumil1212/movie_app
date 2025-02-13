import 'package:dartz/dartz.dart';
import 'package:day_watch/core/usecase/usecase.dart';
import 'package:day_watch/domain/movie/repositories/movie.dart';

import '../../../service_locator.dart';

class GetTrendingMoviesUsecase extends Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    // TODO: implement call
    return await sl<MovieRepository>().getTrendingMovies();
  }
}
