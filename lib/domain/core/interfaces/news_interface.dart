import 'package:fpdart/fpdart.dart';
import 'package:shbsantri/domain/core/models/news_model.dart';

abstract class NewsInterface {
  Future<Either<dynamic, List<NewsModel>>> getNews();
}
