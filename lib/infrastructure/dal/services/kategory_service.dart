import 'package:dio/dio.dart';
import 'package:fpdart/src/either.dart';
import 'package:shbsantri/domain/core/interfaces/category_interface.dart';
import 'package:shbsantri/domain/core/models/category_model.dart';
import 'package:shbsantri/utils/network/endpoint.dart';

class CategoryService implements CategoryInterface {
  Dio dio = Dio();

  @override
  Future<Either<dynamic, CategoryModel>> addCategory(
      String categoryName) async {
    try {
      var response =
          await dio.post(Endpoint.category, data: {"name": categoryName});

      if (response.statusCode == 200) {
        CategoryModel category = CategoryModel.fromJson(response.data['data']);
        return Right(category);
      } else {
        return const Left('Failed to add category');
      }
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<dynamic, bool>> deleteCategory(int categoryId) {
    // TODO: implement deleteCategory
    throw UnimplementedError();
  }

  @override
  Future<Either<dynamic, List<CategoryModel>>> fetchCategories() async {
    try {
      var response = await dio.get(Endpoint.category);

      if (response.statusCode == 200) {
        List<CategoryModel> categories = (response.data['data'] as List)
            .map((item) => CategoryModel.fromJson(item))
            .toList();
        return Right(categories);
      } else {
        return const Left('Failed to fetch categories');
      }
    } catch (e) {
      return Left('Error: $e');
    }
  }

  @override
  Future<Either<dynamic, CategoryModel>> updateCategory(
      int categoryId, String newCategoryName) {
    // TODO: implement updateCategory
    throw UnimplementedError();
  }
}
