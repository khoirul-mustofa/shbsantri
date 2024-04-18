import 'package:get/get.dart';

import 'size_platform.dart';

class ResponsiveHomeUtil {
  static double getWidthCardNews() {
    switch (Get.width) {
      case < mobileWidth: // mobile
        return 10;
      case < tabWidth: // tablet
        return 300;
      default: // desktop
        return 300;
    }
  }

  static int getGridViewCrossAxisCount() {
    switch (Get.width) {
      case < mobileWidth: // mobile
        return 1;
      case < tabWidth: // tablet
        return 2;
      default: // desktop
        return 3;
    }
  }
}
