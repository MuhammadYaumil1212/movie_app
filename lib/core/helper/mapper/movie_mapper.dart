import 'package:day_watch/data/movie/models/movie_model.dart';
import 'package:day_watch/domain/movie/entities/movie_entity.dart';

class MovieMapper {
  static MovieEntity toEntity(MovieModel movie) {
    return MovieEntity(
      id: movie.id,
      adult: movie.adult,
      backdropPath: movie.backdropPath,
      genreIds: movie.genreIds,
      mediaType: movie.mediaType,
      originalLanguage: movie.originalLanguage,
      originalTitle: movie.originalTitle,
      overview: movie.overview,
      popularity: movie.popularity,
      posterPath: movie.posterPath,
      releaseDate: movie.releaseDate,
      title: movie.releaseDate,
      video: movie.video,
      voteAverage: movie.voteAverage,
      voteCount: movie.voteCount,
    );
  }
}
