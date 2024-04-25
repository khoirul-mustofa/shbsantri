import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shbsantri/domain/core/models/news_model.dart';
import 'package:shbsantri/infrastructure/dal/daos/local_storage.dart';
import 'package:shbsantri/infrastructure/dal/services/news_service.dart';

class HomeController extends GetxController {
  bool showDialogMenu = false;
  ScrollController scrollController = ScrollController();
  double offsetScroll = 0.0;
  final _newsService = NewsService();
  bool isloadingScreen = false;
  List<DataNews> news = [];
  bool isNotEmptyToken = false;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    scrollController.addListener(() {
      offsetScroll = scrollController.offset;
      update();
    });
    checkBearerToken();
    getNews();
  }

  checkBearerToken() {
    LocalStorage.getToken().then((value) {
      if (value != null) {
        isNotEmptyToken = true;
        update();
      } else {
        isNotEmptyToken = false;
        update();
      }
    });
  }

  void onDispose() {
    super.onClose();
    scrollController.dispose();
    offsetScroll = 0.0;
    update();
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
    update();
  }

  Future<void> getNews() async {
    isloadingScreen = true;
    update();
    final result = await _newsService.getNews();
    result.fold(
      (l) => Get.defaultDialog(middleText: l.toString()),
      (r) {
        news.assignAll(r.data ?? []);
        isloadingScreen = false;
        update();
      },
    );
  }
}
