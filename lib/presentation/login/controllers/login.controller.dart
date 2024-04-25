import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shbsantri/infrastructure/dal/services/auth_service.dart';
import 'package:shbsantri/infrastructure/navigation/routes.dart';

class LoginController extends GetxController {
  bool isObscurePassword = false;
  bool isloadingScreen = false;
  final _authService = AuthService();
  var emailC = TextEditingController(text: "mustofa@example.com");
  var passwordC = TextEditingController(text: "12345678");

  void obscureText() {
    isObscurePassword = !isObscurePassword;
    update();
  }

  void login() async {
    if (emailC.text.isEmpty || passwordC.text.isEmpty) {
      Get.defaultDialog(middleText: 'Data Tidak Boleh Kosong');
      return;
    }
    isloadingScreen = true;
    update();
    final result =
        await _authService.signInWithEmail(emailC.text, passwordC.text);
    result.fold(
      (l) => Get.defaultDialog(middleText: l),
      (r) => Get.offAllNamed(Routes.DASHBOARD),
    );
  }
}
