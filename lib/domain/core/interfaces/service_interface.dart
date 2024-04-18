import 'package:dio/dio.dart';
import 'package:shbsantri/interceptor/custom_dio_interceptor.dart';

abstract class ServiceInterface {
  Dio dio = Dio()..interceptors.add(CustomDioInterceptor());
}
