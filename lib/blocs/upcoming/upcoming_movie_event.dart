import 'package:equatable/equatable.dart';

abstract class UpComingMovieEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class UpComingMovieGet extends UpComingMovieEvent {
  final int page;

  UpComingMovieGet(this.page);

  @override
  List<Object?> get props => [page];
}
