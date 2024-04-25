import 'dart:ui';

// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:get/get.dart';
import 'package:shbsantri/domain/core/models/user_model.dart';
import 'package:shbsantri/infrastructure/dal/services/auth_service.dart';
import 'package:shbsantri/utils/logger/instance_logger.dart';
import 'package:shbsantri/utils/network/endpoint.dart';

class DashboardController extends GetxController {
  Color colorbgblue = const Color(0xff273142);
  int selectIndexSidebar = 0;
  UserModel? userModel;
  List<String> listSidebar = [
    'Home',
    'News',
    'Category',
  ];

  // get curent user
  Future<void> getCurrentUser() async {
    AuthService authService = AuthService();
    final result = await authService.getCurrentUser();
    result.fold(
      (l) => logger.e(l),
      (r) {
        userModel = r;
        update();
      },
    );
  }

  void clickAvatar() {
    print('clik avatar');
  }

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  void changeIndexSidebar(int value) {
    selectIndexSidebar = value;
    update();
  }

  newTab() {
    html.window.open('https://flutter.dev', 'new tab');
  }
}
