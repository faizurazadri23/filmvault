import 'package:dio/dio.dart';
import 'package:filmvault/blocs/detail_movie/detail_movie_event.dart';
import 'package:filmvault/blocs/detail_movie/detail_movie_state.dart';
import 'package:filmvault/model/api/detail_movie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/constants/response_messages.dart';
import '../../core/network/dio_client.dart';

class DetailMovieBloc extends Bloc<DetailMovieEvent, DetailMovieState> {
  DetailMovieBloc() : super(DetailInitialMovie()) {
    on<DetailMovieGet>(_onDetailMovieGet);
  }

  Future<void> _onDetailMovieGet(
      DetailMovieGet event, Emitter<DetailMovieState> emit) async {
    try {
      emit(DetailLoadingMovie());

      var response = await DioClient().dio.get('movie/${event.movieId}');

      emit(DetailSuccessMovie(DetailMovie.fromJson(response.data)));
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode;

      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        emit(DetailFailedMovie(ResponseMessages.requestTimeout));
      } else if (statusCode == 503 || statusCode == 502) {
        emit(DetailFailedMovie(ResponseMessages.networkError));
      } else if (statusCode == 500) {
        emit(DetailFailedMovie(ResponseMessages.internalServerError));
      } else {
        emit(DetailFailedMovie(ResponseMessages.genericError));
      }
    }
  }
}
