import 'package:equatable/equatable.dart';

import '../../model/api/top_rated_result.dart';

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

  final TopRatedResult topRatedResult;


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
