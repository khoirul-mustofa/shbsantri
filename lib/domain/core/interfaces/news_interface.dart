import 'package:fpdart/fpdart.dart';
import 'package:shbsantri/domain/core/models/news_model.dart';

abstract class NewsInterface {
  Future<Either<dynamic, NewsModel>> getNews();

  Future<Either<dynamic, DataNews>> createNews(
      {required String title,
      required String content,
      required String image,
      String? video,
      String? pdf,
      String? ppt,
      required int categoryId,
      required int userId});
}
