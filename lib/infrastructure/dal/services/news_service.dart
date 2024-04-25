import 'package:fpdart/fpdart.dart';
import 'package:shbsantri/domain/core/interfaces/news_interface.dart';
import 'package:shbsantri/domain/core/interfaces/service_interface.dart';
import 'package:shbsantri/domain/core/models/news_model.dart';
import 'package:shbsantri/utils/network/endpoint.dart';

class NewsService extends ServiceInterface implements NewsInterface {
  @override
  Future<Either<dynamic, NewsModel>> getNews({
    String? search,
    int categoryId = 0,
    int userId = 0,
    int page = 1,
    int size = 10,
  }) async {
    try {
      // Buat map untuk menyimpan query parameters
      final Map<String, dynamic> queryParams = {
        'category_id': categoryId,
        'user_id': userId,
        'page': page,
        'size': size,
      };

      // Tambahkan parameter 'search' jika nilainya tidak kosong atau null
      if (search != null && search.isNotEmpty) {
        queryParams['search'] = search;
      }

      final response =
          await dio.get(Endpoint.news, queryParameters: queryParams);
      final data = response.data;

      return Right(NewsModel.fromJson(data));
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<dynamic, DataNews>> createNews(
      {required String title,
      required String content,
      required String image,
      String? video,
      String? pdf,
      String? ppt,
      required int categoryId,
      required int userId}) async {
    try {
      final response = await dio.post(Endpoint.news);
      final data = response.data['data'];
      return Right(DataNews.fromJson(data));
    } catch (e) {
      return Left(e);
    }
  }
}
