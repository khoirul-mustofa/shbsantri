import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shbsantri/infrastructure/theme/colors/colors_app.dart';

import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';

void main() async {
  var initialRoute = await Routes.initialRoute;
  await dotenv.load(fileName: '.env');
  // print(dotenv.get('API_URL'));

  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;

  const Main(this.initialRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    dotenv.get('API_URL');
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            primaryColor: lightPrimaryColor,
            scaffoldBackgroundColor: lightBackgroundColor,
            appBarTheme: const AppBarTheme(
              backgroundColor: lightBackgroundColor,
            ),
            colorScheme: ColorScheme.fromSwatch().copyWith(
              background: lightBackgroundColor,
              primary: lightPrimaryColor,
              secondary: lightPrimaryColor,
            ),
          ),
          initialRoute: initialRoute,
          getPages: Nav.routes,
        );
      },
    );
  }
}
