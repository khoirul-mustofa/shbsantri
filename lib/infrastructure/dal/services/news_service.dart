import 'package:fpdart/fpdart.dart';
import 'package:shbsantri/domain/core/interfaces/news_interface.dart';
import 'package:shbsantri/domain/core/interfaces/service_interface.dart';
import 'package:shbsantri/domain/core/models/news_model.dart';
import 'package:shbsantri/utils/network/endpoint.dart';

class NewsService extends ServiceInterface implements NewsInterface {
  @override
  Future<Either<dynamic, List<NewsModel>>> getNews() async {
    try {
      final response = await dio.get(Endpoint.news, queryParameters: {
        // 'search': '',
        'category_id': 1,
        'user_id': 1,
        'page': 1,
        'size': 10,
      });
      final data = response.data['data'];

      return Right(List.of(data).map((e) => NewsModel.fromJson(e)).toList());
    } catch (e) {
      return Left(e);
    }
  }
}
