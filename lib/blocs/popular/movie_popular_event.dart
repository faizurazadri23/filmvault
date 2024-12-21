import 'package:equatable/equatable.dart';

abstract class MoviePopularEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class MoviePopularGet extends MoviePopularEvent {
  final int page;

  MoviePopularGet(this.page);

  @override
  List<Object?> get props => [page];
}
