part of 'playing_now_cubit.dart';

@immutable
sealed class PlayingNowState {}

final class PlayingNowInitial extends PlayingNowState {}

final class PlayingNowLoading extends PlayingNowState {}

final class PlayingNowLoaded extends PlayingNowState {
  final List<MovieEntity> movies;
  PlayingNowLoaded({required this.movies});
}

final class FailureLoad extends PlayingNowState {
  final String errorMessage;
  FailureLoad({required this.errorMessage});
}
