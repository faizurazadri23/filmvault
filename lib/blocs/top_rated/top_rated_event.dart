import 'package:equatable/equatable.dart';

abstract class TopRatedEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class TopRatedGet extends TopRatedEvent{

  final int page;


  TopRatedGet(this.page);

  @override
  List<Object?> get props => [page];
}