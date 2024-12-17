import 'package:dio/dio.dart';
import 'package:filmvault/blocs/now_movie_playing/now_movie_playing_event.dart';
import 'package:filmvault/blocs/now_movie_playing/now_movie_playing_state.dart';
import 'package:filmvault/model/api/now_movie_result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/constants/response_messages.dart';
import '../../core/network/dio_client.dart';

class NowMoviePlayingBloc
    extends Bloc<NowMoviePlayingEvent, NowMoviePlayingState> {
  NowMoviePlayingBloc() : super(NowMovieInitialPlaying()) {
    on<NowMoviePlayingGet>(_onNowMoviePlayingGet);
  }

  Future<void> _onNowMoviePlayingGet(
      NowMoviePlayingGet event, Emitter<NowMoviePlayingState> emit) async {
    try {
      emit(NowMovieLoadingPlaying());

      var response =
          await DioClient().dio.get('movie/now_playing', queryParameters: {
        'size': event.page,
      });

      emit(NowMovieSuccessPlaying(NowMovieResult.fromJson(response.data)));
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode;

      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        emit(NowMovieFailedPlaying(ResponseMessages.requestTimeout));
      } else if (statusCode == 503 || statusCode == 502) {
        emit(NowMovieFailedPlaying(ResponseMessages.networkError));
      } else if (statusCode == 500) {
        emit(NowMovieFailedPlaying(ResponseMessages.internalServerError));
      } else {
        emit(NowMovieFailedPlaying(ResponseMessages.genericError));
      }
    }
  }
}
