import 'package:equatable/equatable.dart';

abstract class DetailMovieEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class DetailMovieGet extends DetailMovieEvent {
  final int movieId;

  DetailMovieGet(this.movieId);

  @override
  List<Object?> get props => [movieId];
}
