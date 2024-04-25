import 'package:fpdart/fpdart.dart';
import 'package:shbsantri/domain/core/models/category_model.dart';

abstract class CategoryInterface {
  Future<Either<dynamic, List<CategoryModel>>> fetchCategories();
  Future<Either<dynamic, CategoryModel>> addCategory(String categoryName);
  Future<Either<dynamic, CategoryModel>> updateCategory(
      int categoryId, String newCategoryName);
  Future<Either<dynamic, bool>> deleteCategory(int categoryId);
}
