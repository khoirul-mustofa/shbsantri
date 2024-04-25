import 'dart:developer';
import 'dart:html';

import 'dart:io';
import 'dart:ui';
import 'package:dio/dio.dart' as d;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:shbsantri/domain/core/models/category_model.dart';
import 'package:shbsantri/infrastructure/dal/services/file_service.dart';
import 'package:shbsantri/infrastructure/dal/services/kategory_service.dart';
import 'package:shbsantri/utils/logger/instance_logger.dart';
import 'package:shbsantri/utils/network/endpoint.dart';

class DashboardAddNewsController extends GetxController {
  bool loading = false;
  QuillController htmlController = QuillController.basic();
  QuillController htmlViewController = QuillController.basic();
  List<CategoryModel> categories = [];
  CategoryModel? selectedCategory;
  String? urlImage;
  String? urlPpt;
  String? urlPdf;

  final CategoryService _categoryService = CategoryService();

  void setSelectCategory(CategoryModel value) {
    selectedCategory = value;
    print(selectedCategory?.name);
    update();
  }

  Uint8List? imageBytes;
  String? imageName;
  String? pptName;
  Uint8List? pptBytes;
  String? pdfName;
  Uint8List? pdfBytes;

  void imagePicker() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        Uint8List bytes = result.files.first.bytes!;
        imageName = result.files.first.name;
        imageBytes = bytes;
        update();
        uploadImage();
      } else {
        Get.snackbar('Cancel', 'Cancelled the picker');
      }
    } on PlatformException catch (e) {
      logger.e('Failed to pick image: $e');
    }
  }

  void pptPicker() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        Uint8List bytes = result.files.first.bytes!;
        pptName = result.files.first.name;
        pptBytes = bytes;
        update();
        uploadImage();
      } else {
        Get.snackbar('Cancel', 'Cancelled the picker');
      }
    } on PlatformException catch (e) {
      print('Failed to pick ppt: $e');
    }
  }

  void pdfPicker() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        Uint8List bytes = result.files.first.bytes!;
        pdfName = result.files.first.name;
        pdfBytes = bytes;
        update();
        uploadImage();
      } else {
        Get.snackbar('Cancel', 'Cancelled the picker');
      }
    } on PlatformException catch (e) {
      logger.e('Failed to pick pdf: $e');
    }
  }

  void uploadImage() async {
    loading = true;
    update();
    try {
      String uploadUrl = Endpoint.uploadImage;

      d.Dio dio = d.Dio();

      final formData = d.FormData.fromMap({
        "image": d.MultipartFile.fromBytes(
          imageBytes ?? Uint8List(0),
          filename: imageName,
        ),
      });

      var response = await dio.post(uploadUrl, data: formData);

      if (response.statusCode == 200) {
        var responseData = response.data;
        var imagePath = responseData['path'];
        urlImage = imagePath;
        print('Image uploaded successfully. Path: $imagePath');
      } else {
        logger.e('Failed to upload image. Status code: ${response.statusCode}');
      }

      loading = false;
      update();
    } catch (e) {
      logger.e('Error: $e');
      loading = false;
      update();
    }
  }

  void uploadPpt() async {
    loading = true;
    update();
    try {
      String uploadUrl = Endpoint.uploadPpt;

      d.Dio dio = d.Dio();

      final formData = d.FormData.fromMap({
        "ppt": d.MultipartFile.fromBytes(
          imageBytes ?? Uint8List(0),
          filename: pptName,
        ),
      });

      var response = await dio.post(uploadUrl, data: formData);

      if (response.statusCode == 200) {
        var responseData = response.data;
        var pptPath = responseData['path'];
        print('Ppt uploaded successfully. Path: $pptPath');
      } else {
        logger.e('Failed to upload ppt. Status code: ${response.statusCode}');
      }

      loading = false;
      update();
    } catch (e) {
      logger.e('Error: $e');
      loading = false;
      update();
    }
  }

  void uploadPdf() async {
    loading = true;
    update();
    try {
      String uploadUrl = Endpoint.uploadPdf;

      d.Dio dio = d.Dio();

      final formData = d.FormData.fromMap({
        "pdf": d.MultipartFile.fromBytes(
          imageBytes ?? Uint8List(0),
          filename: pdfName,
        ),
      });

      var response = await dio.post(uploadUrl, data: formData);

      if (response.statusCode == 200) {
        var responseData = response.data;
        var pptPath = responseData['path'];
        print('Pdf uploaded successfully. Path: $pptPath');
      } else {
        logger.e('Failed to upload pdf. Status code: ${response.statusCode}');
      }

      loading = false;
      update();
    } catch (e) {
      logger.e('Error: $e');
      loading = false;
      update();
    }
  }

  void getCategories() async {
    loading = true;
    update();
    final result = await _categoryService.fetchCategories();
    result.fold(
      (l) => logger.e(l),
      (r) {
        categories.assignAll(r);
        update();
      },
    );
    loading = false;
    update();
  }

  simpanNews() {
    try {} catch (e) {}
  }

  @override
  void onInit() {
    super.onInit();
    getCategories();
  }
}
