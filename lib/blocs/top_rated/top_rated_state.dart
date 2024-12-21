import 'package:equatable/equatable.dart';

import '../../model/api/movie_result.dart';

abstract class TopRatedState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TopRatedLoading extends TopRatedState {
  @override
  List<Object?> get props => [];
}

class TopRatedInitial extends TopRatedState {
  @override
  List<Object?> get props => [];
}

class TopRatedSuccess extends TopRatedState {

  final MovieResult topRatedResult;


  TopRatedSuccess(this.topRatedResult);

  @override
  List<Object?> get props => [topRatedResult];
}

class TopRatedFailed extends TopRatedState {
  final String message;

  TopRatedFailed(this.message);

  @override
  List<Object?> get props => [message];
}
