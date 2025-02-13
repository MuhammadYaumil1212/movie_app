import 'package:day_watch/data/movie/models/tv_model.dart';
import 'package:day_watch/domain/movie/entities/tv_entity.dart';

class TvMapper {
  static TvEntity toEntity(TvModel movie) {
    return TvEntity(
      id: movie.id,
      adult: movie.adult,
      backdropPath: movie.backdropPath,
      genreIds: movie.genreIds,
      originalLanguage: movie.originalLanguage,
      overview: movie.overview,
      popularity: movie.popularity,
      posterPath: movie.posterPath,
      voteAverage: movie.voteAverage,
      voteCount: movie.voteCount,
    );
  }
}
