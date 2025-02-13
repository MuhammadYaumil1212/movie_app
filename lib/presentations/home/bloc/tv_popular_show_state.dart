part of 'tv_popular_show_cubit.dart';

@immutable
sealed class TvPopularShowState {}

final class TvPopularShowInitial extends TvPopularShowState {}

final class TvLoading extends TvPopularShowState {}

final class TvLoaded extends TvPopularShowState {
  final List<TvEntity> movies;
  TvLoaded({required this.movies});
}

final class TvLoadingFailed extends TvPopularShowState {
  final String message;
  TvLoadingFailed({required this.message});
}
