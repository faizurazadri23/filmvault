import 'package:dio/dio.dart';
import 'package:filmvault/blocs/movie_trending/movie_trending_event.dart';
import 'package:filmvault/blocs/movie_trending/movie_trending_state.dart';
import 'package:filmvault/model/api/trending_movie_result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/constants/response_messages.dart';
import '../../core/network/dio_client.dart';

class MovieTrendingBloc extends Bloc<MovieTrendingEvent, MovieTrendingState> {
  MovieTrendingBloc() : super(MovieInitialTrending()) {
    on<MovieTrendingGet>(_onMovieTrendingGet);
  }

  Future<void> _onMovieTrendingGet(
      MovieTrendingGet event, Emitter<MovieTrendingState> emit) async {
    try {
      emit(MovieLoadingTrending());

      var response =
          await DioClient().dio.get('trending/movie/day');

      emit(MovieSuccessTrending(TrendingMovieResult.fromJson(response.data)));
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode;

      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        emit(MovieFailedTrending(ResponseMessages.requestTimeout));
      } else if (statusCode == 503 || statusCode == 502) {
        emit(MovieFailedTrending(ResponseMessages.networkError));
      } else if (statusCode == 500) {
        emit(MovieFailedTrending(ResponseMessages.internalServerError));
      } else {
        emit(MovieFailedTrending(ResponseMessages.genericError));
      }
    }
  }
}
