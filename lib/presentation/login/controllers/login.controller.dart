import 'package:get/get.dart';
import 'package:shbsantri/infrastructure/dal/services/auth_service.dart';

class LoginController extends GetxController {
  bool isObscurePassword = false;
  bool isloadingScreen = false;
  final _authService = AuthService();

  void obscureText() {
    isObscurePassword = !isObscurePassword;
    update();
  }

  void login() async {
    print('login');
    isloadingScreen = true;
    update();
    final result =
        await _authService.signInWithEmail('mustofa@example.com', '12345678');
    result.fold(
      (l) => Get.defaultDialog(middleText: 'Gagal Login'),
      (r) => Get.defaultDialog(middleText: 'Berhasil Login'),
    );
  }
}
