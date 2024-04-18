// ignore_for_file: depend_on_referenced_packages

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class CustomDioInterceptor extends Interceptor {
  Logger logger = Logger();
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["Content-Type"] = "application/json";
    options.headers["Authorization"] = "Bearer YOUR_TOKEN_HERE";
    super.onRequest(options, handler);
    logger.i(
        'Request ke: ${options.uri}\n headers: ${options.headers}\n body: ${options.data}\n method: ${options.method}\n token: ${options.headers["Authorization"]}');
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    logger.i(
        'Response dari: ${response.requestOptions.uri}\n status: ${response.statusCode}\n data: ${response.data}\n headers: ${response.headers}\n method: ${response.requestOptions.method}');
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Handle error
    super.onError(err, handler);
    logger.e(err);
  }
}
