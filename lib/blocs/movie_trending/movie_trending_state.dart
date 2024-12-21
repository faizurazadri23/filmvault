import 'package:equatable/equatable.dart';

import '../../model/api/movie_result.dart';

abstract class MovieTrendingState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MovieLoadingTrending extends MovieTrendingState {
  @override
  List<Object?> get props => [];
}

class MovieInitialTrending extends MovieTrendingState {
  @override
  List<Object?> get props => [];
}

class MovieSuccessTrending extends MovieTrendingState {
  final MovieResult trendingMovieResult;

  MovieSuccessTrending(this.trendingMovieResult);

  @override
  List<Object?> get props => [trendingMovieResult];
}

class MovieFailedTrending extends MovieTrendingState {
  final String message;

  MovieFailedTrending(this.message);

  @override
  List<Object?> get props => [message];
}
