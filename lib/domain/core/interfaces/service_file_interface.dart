import 'dart:io';

abstract class ServiceFileInterface {
  Future<String> uploadImage();
  Future<String> uploadPPT(File ppt);
  Future<String> uploadPDF(File pdf);
  Future<File> downloadImage(String url);
  Future<File> downloadPPT(String url);
  Future<File> downloadPDF(String url);
}
