import 'package:get/get.dart';
import 'package:shbsantri/domain/core/models/category_model.dart';
import 'package:shbsantri/infrastructure/dal/services/kategory_service.dart';
import 'package:shbsantri/utils/logger/instance_logger.dart';

class DashboardListCategoryController extends GetxController {
  bool loading = false;

  final CategoryService _categoryService = CategoryService();
  List<CategoryModel> categories = [];
  int number = 0;

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

  void createCategory(String name) async {
    loading = true;
    update();
    final result = await _categoryService.addCategory(name);
    result.fold(
      (l) => logger.e(l),
      (r) {
        getCategories();
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
