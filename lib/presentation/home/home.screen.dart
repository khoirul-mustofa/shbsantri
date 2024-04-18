import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shbsantri/infrastructure/components/custom_button.dart';
import 'package:shbsantri/infrastructure/components/footer.dart';
import 'package:shbsantri/infrastructure/navigation/routes.dart';
import 'package:shbsantri/infrastructure/theme/colors/colors_app.dart';
import 'package:shbsantri/infrastructure/components/news_card.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: Container(
            width: Get.width <= 500 ? Get.width : Get.width * 0.8,
            margin: EdgeInsets.only(
                left: Get.width < 500 ? 0 : Get.width * 0.085, top: 20),
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: Get.width < 1000,
                  child: PopupMenuButton<String>(
                    icon: const Icon(Icons.menu),
                    onSelected: (String value) {},
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      const PopupMenuItem<String>(
                        value: 'Option 1',
                        child: Text('Option 1'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'Option 100',
                        child: Text('Option 2'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'Option 3',
                        child: Text('Option 3'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'Option 4',
                        child: Text('Option 4'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: Get.width > 900 ? 0 : 20.w,
                ),
                SizedBox(
                  width: Get.width > 900 ? 86 : 86,
                  height: Get.width > 900 ? 48 : 48,
                  child: Image.asset(
                    'assets/logo/logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Visibility(
                  visible: Get.width < 600 ? false : true,
                  child: Text(
                    'shbsantri',
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: lightPrimaryColor),
                  ),
                ),
                const Spacer(),
                Visibility(
                  visible: Get.width > 1000,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Tulisan",
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                      const Text(
                        "Kajian",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(5),
                  height: getButtonHeight(MySize.large),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.LOGIN);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: lightPrimaryColor,
                    ),
                    child: Text(
                      "Masuk",
                      style: TextStyle(
                          fontSize: getFontSize(MySize.medium),
                          color: lightBackgroundColor),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            controller: controller.scrollController,
            physics: const BouncingScrollPhysics(),
            child: Container(
              width: Get.width > 600 ? Get.width * 0.8 : Get.width,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Ngaji & Kerisis Perusahaan",
                    style: GoogleFonts.poppins(
                      fontSize: Get.width > 600 ? 40 : 30,
                      fontWeight: FontWeight.w800,
                      color: lightPrimaryFontColor,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Tempat Belajar Koding Paling Asik Dengan Materi Video Maupun Tulisan Yang \nMudah Dipahami",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: lightPrimaryFontColor,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: Get.width < 600 ? Get.width : Get.width * 0.5,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Cari',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide:
                              BorderSide(color: Colors.grey.withOpacity(0.9)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide:
                              BorderSide(color: Colors.grey.withOpacity(0.9)),
                        ),
                        filled: true,
                        fillColor: lightBackgroundColor,
                      ),
                      style: TextStyle(fontSize: 14, color: Colors.grey[900]),
                    ),
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  Text(
                    "Tulisan",
                    style: GoogleFonts.poppins(
                      fontSize: 39,
                      fontWeight: FontWeight.bold,
                      color: lightPrimaryFontColor,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'Belajar koding melalui tulisan menghemat waktu, baca & langsung aksi !',
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: lightPrimaryFontColor),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth > 1000) {
                        return GridView.builder(
                          shrinkWrap: true,
                          itemCount: controller.news.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 16, // Sesuaikan dengan Bootstrap
                            mainAxisSpacing: 16, // Sesuaikan dengan Bootstrap
                          ),
                          itemBuilder: (context, index) {
                            return NewsCard(
                              imageUrl: controller.news[index].image ?? '',
                              title: controller.news[index].title ?? '',
                              excerpt: controller.news[index].content ?? '',
                              category:
                                  controller.news[index].category?.name ?? '',
                            );
                          },
                        );
                      } else if (constraints.maxWidth > 600) {
                        return GridView.builder(
                          shrinkWrap: true,
                          itemCount: controller.news.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16, // Sesuaikan dengan Bootstrap
                            mainAxisSpacing: 16, // Sesuaikan dengan Bootstrap
                          ),
                          itemBuilder: (context, index) {
                            return NewsCard(
                              imageUrl: controller.news[index].image ?? '',
                              title: controller.news[index].title ?? '',
                              excerpt: controller.news[index].content ?? '',
                              category:
                                  controller.news[index].category?.name ?? '',
                            );
                          },
                        );
                      } else {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.news.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: NewsCard(
                                imageUrl: controller.news[index].image ?? '',
                                title: controller.news[index].title ?? '',
                                excerpt: controller.news[index].content ?? '',
                                category:
                                    controller.news[index].category?.name ?? '',
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                  const Footer()
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.animateToTop();
          },
          child: const Icon(Icons.arrow_upward),
        ),
      );
    });
  }
}
