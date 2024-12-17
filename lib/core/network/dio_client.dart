import 'package:dio/dio.dart';
import 'package:filmvault/config/constants/app_strings.dart';

class DioClient {
  final Dio dio;

  DioClient({BaseOptions? options})
      : dio = Dio(options ??
            BaseOptions(
              baseUrl: 'https://api.themoviedb.org/3/',
              connectTimeout: const Duration(seconds: 30),
              receiveTimeout: const Duration(seconds: 30),
              headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
              },
            )) {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        options.headers['Authorization'] = 'Bearer ${AppStrings.accessToken}';
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response); // Lanjutkan response
      },
      onError: (DioException e, handler) {
        return handler.next(e);
      },
    ));
  }
}
