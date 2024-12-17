import 'package:equatable/equatable.dart';
import 'package:filmvault/model/api/now_movie_result.dart';

abstract class NowMoviePlayingState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NowMovieInitialPlaying extends NowMoviePlayingState {
  @override
  List<Object?> get props => [];
}

class NowMovieLoadingPlaying extends NowMoviePlayingState {
  @override
  List<Object?> get props => [];
}

class NowMovieSuccessPlaying extends NowMoviePlayingState {
  final NowMovieResult nowMovieResult;

  NowMovieSuccessPlaying(this.nowMovieResult);

  @override
  List<Object?> get props => [nowMovieResult];
}

class NowMovieFailedPlaying extends NowMoviePlayingState {
  final String message;

  NowMovieFailedPlaying(this.message);

  @override
  List<Object?> get props => [];
}
