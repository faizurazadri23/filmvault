import 'package:filmvault/blocs/movie_trending/movie_trending_bloc.dart';
import 'package:filmvault/blocs/now_movie_playing/now_movie_bloc.dart';
import 'package:filmvault/blocs/upcoming/upcoming_movie_bloc.dart';
import 'package:get_it/get_it.dart';

import '../network/dio_client.dart';

GetIt inject = GetIt.instance;

Future<void> di() async {
  //For Bloc
  inject.registerFactory(() => NowMoviePlayingBloc());
  inject.registerFactory(() => MovieTrendingBloc());
  inject.registerFactory(() => UpComingMovieBloc());

  inject.registerLazySingleton(() => inject<DioClient>().dio);

  inject.registerLazySingleton(() => DioClient());
}
