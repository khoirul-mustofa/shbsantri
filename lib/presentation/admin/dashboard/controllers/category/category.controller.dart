import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shbsantri/domain/core/models/category_model.dart';
import 'package:shbsantri/infrastructure/dal/services/kategory_service.dart';
import 'package:shbsantri/presentation/admin/widget/category/dashboard_add_category_widget.dart';
import 'package:shbsantri/utils/logger/instance_logger.dart';

class CategoryController extends GetxController {
  TextEditingController nameController = TextEditingController();
  bool loading = false;
  final formKey = GlobalKey<FormState>();
  final CategoryService _categoryService = CategoryService();
  List<CategoryModel> categories = [];
  int number = 0;

  bool isEdit = false;
  int? idCategory;

  void edit(int id, String name) async {
    isEdit = true;
    update();
    nameController.text = name;
    Get.dialog(DashboardAddCategoryWidget()).whenComplete(() {
      isEdit = false;
      nameController.clear();
      update();
    });
    idCategory = id;
    update();
  }

  void saveCategory() async {
    if (formKey.currentState!.validate()) {
      loading = true;
      update();

      final result = await _categoryService.addCategory(nameController.text);
      result.fold(
        (l) {
          Get.back();
          Get.defaultDialog(
            middleText: l.toString(),
            confirm: ElevatedButton(
                onPressed: () => Get.back(), child: const Text('Ok')),
          );
        },
        (r) {
          Get.back();
          Get.defaultDialog(middleText: 'Success');
          Future.delayed(1.seconds).then((value) {
            Get.back();
          });
        },
      );
      loading = false;
      update();
    }
  }

  void updateCategory() async {
    if (formKey.currentState!.validate()) {
      loading = true;
      update();

      final result = await _categoryService.addCategory(nameController.text);
      result.fold(
        (l) {
          Get.back();
          Get.defaultDialog(
            middleText: l.toString(),
            confirm: ElevatedButton(
                onPressed: () => Get.back(), child: const Text('Ok')),
          );
        },
        (r) {
          Get.back();
          Get.defaultDialog(middleText: 'Success');
          Future.delayed(1.seconds).then((value) => Get.back());
        },
      );
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
        categories.clear();
        categories.assignAll(r);
        update();
      },
    );
    loading = false;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getCategories();
  }
}
