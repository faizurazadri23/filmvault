import 'package:equatable/equatable.dart';

abstract class NowMoviePlayingEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class NowMoviePlayingGet extends NowMoviePlayingEvent {
  final int page;

  NowMoviePlayingGet(this.page);

  @override
  List<Object?> get props => [page];
}
