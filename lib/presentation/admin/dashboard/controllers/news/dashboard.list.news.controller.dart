// buatakn controllernya
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shbsantri/domain/core/models/news_model.dart';
import 'package:shbsantri/infrastructure/dal/services/news_service.dart';

class DashboardListNewsController extends GetxController {
  final _newsService = NewsService();
  bool isloadingScreen = false;
  List<DataNews> news = [];
  NewsModel? newsModel;
  int number = 0;

  TextEditingController search = TextEditingController();
  int? categoryId;
  int? userId;
  int page = 1;
  int size = 10;

  @override
  void onInit() {
    super.onInit();
    getNews();
  }

  void onDispose() {
    super.onClose();
  }

  void nextPage() {
    number = number + 10;
    page++;
    update();
    getNews();
  }

  void previousPage() {
    number = number - 10;
    page--;
    update();
    getNews();
  }

  Future<void> getNews() async {
    isloadingScreen = true;
    update();
    final result = await _newsService.getNews(
      search: search.text,
      categoryId: categoryId ?? 0,
      userId: userId ?? 0,
      page: page,
      size: size,
    );
    result.fold(
      (l) {
        isloadingScreen = false;
        update();
      },
      (r) {
        news.assignAll(r.data ?? []);
        newsModel = r;
        isloadingScreen = false;
        update();
      },
    );
  }
}
