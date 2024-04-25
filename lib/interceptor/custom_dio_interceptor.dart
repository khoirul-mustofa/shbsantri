// ignore_for_file: depend_on_referenced_packages

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:shbsantri/infrastructure/dal/daos/local_storage.dart';

class CustomDioInterceptor extends Interceptor {
  Logger logger = Logger();

  Future<void> addAuthorizationHeader(RequestOptions options) async {
    final token = await LocalStorage.getToken();
    if (token != null) {
      options.headers["Authorization"] = "Bearer $token";
    }
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["Content-Type"] = "application/json";
    // options.headers["Authorization"] = "Bearer ${LocalStorage.getToken()}";
    super.onRequest(options, handler);
    logger.t(
        'Request ke: ${options.uri}\n headers: ${options.headers}\n body: ${options.data}\n method: ${options.method}\n token: ${options.headers["Authorization"]}');
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Handle error
    super.onError(err, handler);
    logger.e(err);
    // logger.e(err.response);
  }
}
