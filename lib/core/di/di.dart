import 'package:filmvault/blocs/now_movie_playing/now_movie_bloc.dart';
import 'package:get_it/get_it.dart';

import '../network/dio_client.dart';

GetIt inject = GetIt.instance;

Future<void> di() async {
  //For Bloc
  inject.registerFactory(() => NowMoviePlayingBloc());

  inject.registerLazySingleton(() => inject<DioClient>().dio);

  inject.registerLazySingleton(() => DioClient());
}
