import 'package:dio/dio.dart';
import 'package:filmvault/blocs/popular/movie_popular_event.dart';
import 'package:filmvault/blocs/popular/movie_popular_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/constants/response_messages.dart';
import '../../core/network/dio_client.dart';
import '../../model/api/movie_result.dart';

class MoviePopularBloc extends Bloc<MoviePopularEvent, MoviePopularState>{


  MoviePopularBloc():super(MovieInitialPopular()){
   on<MoviePopularGet>(_onMoviePopularGet);
  }

  Future<void> _onMoviePopularGet(MoviePopularGet event, Emitter<MoviePopularState> emit) async{
    try{
      emit(MovieLoadingPopular());

      var response =
      await DioClient().dio.get('trending/movie/popular');

      emit(MovieSuccessPopular(MovieResult.fromJson(response.data)));
    }on DioException catch(e){
      final statusCode = e.response?.statusCode;

      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        emit(MovieFailedPopular(ResponseMessages.requestTimeout));
      } else if (statusCode == 503 || statusCode == 502) {
        emit(MovieFailedPopular(ResponseMessages.networkError));
      } else if (statusCode == 500) {
        emit(MovieFailedPopular(ResponseMessages.internalServerError));
      } else {
        emit(MovieFailedPopular(ResponseMessages.genericError));
      }
    }
  }
}