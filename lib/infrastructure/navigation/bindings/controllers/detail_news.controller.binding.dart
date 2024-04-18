import 'package:get/get.dart';

import '../../../../presentation/detail_news/controllers/detail_news.controller.dart';

class DetailNewsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailNewsController>(
      () => DetailNewsController(),
    );
  }
}
