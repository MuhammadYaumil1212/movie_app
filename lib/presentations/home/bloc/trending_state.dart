part of 'trending_cubit.dart';

@immutable
sealed class TrendingState {}

final class TrendingInitial extends TrendingState {}

final class TrendingLoading extends TrendingState {}

final class TrendingLoaded extends TrendingState {
  final List<MovieEntity> movies;
  TrendingLoaded({required this.movies});
}

final class FailureLoad extends TrendingState {
  final String errorMessage;
  FailureLoad({required this.errorMessage});
}
