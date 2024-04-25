import 'package:get/get.dart';

import '../../../../presentation/admin/dashboard/controllers/news/dashboard.controller.dart';

class DashboardControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
  }
}
