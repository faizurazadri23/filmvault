import 'package:equatable/equatable.dart';

import '../../model/api/movie_result.dart';

abstract class MoviePopularState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MovieInitialPopular extends MoviePopularState {
  @override
  List<Object?> get props => [];
}

class MovieLoadingPopular extends MoviePopularState {
  @override
  List<Object?> get props => [];
}

class MovieSuccessPopular extends MoviePopularState {
  final MovieResult popularMovie;

  MovieSuccessPopular(this.popularMovie);

  @override
  List<Object?> get props => [popularMovie];
}

class MovieFailedPopular extends MoviePopularState {
  final String message;

  MovieFailedPopular(this.message);

  @override
  List<Object?> get props => [message];
}
