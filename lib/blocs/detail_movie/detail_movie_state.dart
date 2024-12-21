import 'package:equatable/equatable.dart';
import 'package:filmvault/model/api/detail_movie.dart';

abstract class DetailMovieState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DetailInitialMovie extends DetailMovieState {
  @override
  List<Object?> get props => [];
}

class DetailLoadingMovie extends DetailMovieState {
  @override
  List<Object?> get props => [];
}

class DetailSuccessMovie extends DetailMovieState {
  final DetailMovie detailMovie;

  DetailSuccessMovie(this.detailMovie);

  @override
  List<Object?> get props => [detailMovie];
}

class DetailFailedMovie extends DetailMovieState {
  final String message;

  DetailFailedMovie(this.message);

  @override
  List<Object?> get props => [message];
}
