import 'package:dio/dio.dart';
import 'package:filmvault/blocs/top_rated/top_rated_event.dart';
import 'package:filmvault/blocs/top_rated/top_rated_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../config/constants/response_messages.dart';
import '../../core/network/dio_client.dart';
import '../../model/api/movie_result.dart';

class TopRatedBloc extends Bloc<TopRatedEvent, TopRatedState> {
  TopRatedBloc() : super(TopRatedInitial()) {
    on<TopRatedGet>(_onTopRatedGet);
  }

  Future<void> _onTopRatedGet(
      TopRatedGet event, Emitter<TopRatedState> emit) async {
    try {
      emit(TopRatedLoading());

      var response =
          await DioClient().dio.get('movie/top_rated', queryParameters: {
        'size': event.page,
      });

      emit(TopRatedSuccess(MovieResult.fromJson(response.data)));
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode;

      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        emit(TopRatedFailed(ResponseMessages.requestTimeout));
      } else if (statusCode == 503 || statusCode == 502) {
        emit(TopRatedFailed(ResponseMessages.networkError));
      } else if (statusCode == 500) {
        emit(TopRatedFailed(ResponseMessages.internalServerError));
      } else {
        emit(TopRatedFailed(ResponseMessages.genericError));
      }
    }
  }
}
