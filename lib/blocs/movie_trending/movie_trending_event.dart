import 'package:equatable/equatable.dart';

abstract class MovieTrendingEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class MovieTrendingGet extends MovieTrendingEvent {
  final int page;

  MovieTrendingGet(this.page);

  @override
  List<Object?> get props => [page];
}
