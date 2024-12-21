import 'package:equatable/equatable.dart';

import '../../model/api/movie_result.dart';

abstract class UpComingMovieState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UpComingInitialMovie extends UpComingMovieState {
  @override
  List<Object?> get props => [];
}

class UpComingLoadingMovie extends UpComingMovieState {
  @override
  List<Object?> get props => [];
}

class UpComingSuccessMovie extends UpComingMovieState {
  final MovieResult upComingMovieResult;

  UpComingSuccessMovie(this.upComingMovieResult);

  @override
  List<Object?> get props => [upComingMovieResult];
}

class UpComingFailedMovie extends UpComingMovieState {
  final String message;

  UpComingFailedMovie(this.message);

  @override
  List<Object?> get props => [message];
}
