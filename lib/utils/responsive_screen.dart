import 'package:flutter/material.dart';

class ResponsiveScreen {
  static double getWidth(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      // mobile
      return 10;
    } else if (screenWidth < 1200) {
      // tablet
      return 300;
    } else {
      // desktop
      return 300;
    }
  }

  static int getGridViewCrossAxisCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      // mobile
      return 1;
    } else if (screenWidth < 1200) {
      // tablet
      return 2;
    } else {
      // desktop
      return 3;
    }
  }
}
