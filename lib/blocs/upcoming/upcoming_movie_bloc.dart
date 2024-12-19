import 'package:dio/dio.dart';
import 'package:filmvault/blocs/upcoming/upcoming_movie_event.dart';
import 'package:filmvault/blocs/upcoming/upcoming_movie_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/constants/response_messages.dart';
import '../../core/network/dio_client.dart';
import '../../model/api/upcoming_movie_result.dart';

class UpComingMovieBloc extends Bloc<UpComingMovieEvent, UpComingMovieState> {
  UpComingMovieBloc() : super(UpComingInitialMovie()) {
    on<UpComingMovieGet>(_onUpComingMovieGet);
  }

  Future<void> _onUpComingMovieGet(
      UpComingMovieGet event, Emitter<UpComingMovieState> emit) async {
    try {
      emit(UpComingLoadingMovie());

      var response =
          await DioClient().dio.get('movie/now_playing', queryParameters: {
        'size': event.page,
      });

      emit(UpComingSuccessMovie(UpComingMovieResult.fromJson(response.data)));
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode;

      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        emit(UpComingFailedMovie(ResponseMessages.requestTimeout));
      } else if (statusCode == 503 || statusCode == 502) {
        emit(UpComingFailedMovie(ResponseMessages.networkError));
      } else if (statusCode == 500) {
        emit(UpComingFailedMovie(ResponseMessages.internalServerError));
      } else {
        emit(UpComingFailedMovie(ResponseMessages.genericError));
      }
    }
  }
}
