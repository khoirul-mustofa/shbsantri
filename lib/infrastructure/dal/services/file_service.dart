import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:shbsantri/domain/core/interfaces/service_interface.dart';
import 'package:shbsantri/domain/core/interfaces/service_file_interface.dart';
import 'package:shbsantri/utils/logger/instance_logger.dart';
import 'package:shbsantri/utils/network/endpoint.dart';

class FileService extends ServiceInterface {
  @override
  Future<Either<dynamic, dynamic>> uploadImage(
      List<int> file, String fileName) async {
    try {
      FormData formData = FormData.fromMap({
        "file": MultipartFile.fromBytes(
          file,
          filename: fileName,
        ),
      });
      var response = await dio.post(Endpoint.uploadImage, data: formData);

      logger.d(response.data);
      return Right(response.data);
    } catch (e) {
      logger.e(e.toString());
      return Left(e);
    }
  }

  @override
  Future<String> uploadPPT(File ppt) async {
    try {
      String fileName = ppt.path.split('/').last;
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(ppt.path, filename: fileName),
      });
      var response = await dio.post('/upload/ppt', data: formData);
      return response.data['path'];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> uploadPDF(File pdf) async {
    try {
      String fileName = pdf.path.split('/').last;
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(pdf.path, filename: fileName),
      });
      var response = await dio.post('/upload/pdf', data: formData);
      return response.data['path'];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<File> downloadImage(String url) async {
    try {
      var response = await dio.get(url,
          options: Options(responseType: ResponseType.bytes));
      File file = File.fromRawPath(response.data);
      return file;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<File> downloadPPT(String url) async {
    try {
      var response = await dio.get(url,
          options: Options(responseType: ResponseType.bytes));
      File file = File.fromRawPath(response.data);
      return file;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<File> downloadPDF(String url) async {
    try {
      var response = await dio.get(url,
          options: Options(responseType: ResponseType.bytes));
      File file = File.fromRawPath(response.data);
      return file;
    } catch (e) {
      rethrow;
    }
  }
}
