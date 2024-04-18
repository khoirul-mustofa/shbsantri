import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shbsantri/domain/core/models/news_model.dart';
import 'package:shbsantri/infrastructure/dal/services/news_service.dart';

class HomeController extends GetxController {
  bool showDialogMenu = false;
  ScrollController scrollController = ScrollController();
  final _newsService = NewsService();
  bool isloadingScreen = false;

  List<NewsModel> news = [];

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    getNews();
  }

  void setShowDialogMenu() {
    showDialogMenu = !showDialogMenu;
    update();
  }

  void animateToTop() {
    scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  Future<void> getNews() async {
    isloadingScreen = true;
    update();
    final result = await _newsService.getNews();
    result.fold(
      (l) => Get.defaultDialog(middleText: l.toString()),
      (r) {
        print(r[0].image);
        news.assignAll(r);
        update();
      },
    );
  }
}
