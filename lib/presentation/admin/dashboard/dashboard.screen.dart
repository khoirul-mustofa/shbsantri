import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shbsantri/infrastructure/theme/colors/colors_app.dart';
import 'package:shbsantri/presentation/admin/dashboard/controllers/news/dashboard.controller.dart';
import 'package:shbsantri/presentation/admin/widget/category/dashboard_add_category_widget.dart';
import 'package:shbsantri/presentation/admin/widget/category/dashboard_list_category_widget.dart';
import 'package:shbsantri/presentation/admin/widget/news/dashboard_list_news_widget.dart';
import 'package:shbsantri/presentation/admin/widget/news/dashboard_add_news_widget.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffF3EDF7),
          title: Text(
            'Dashboard',
            style: GoogleFonts.nunitoSans(fontWeight: FontWeight.bold),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  controller.newTab();
                },
                child: const Text('view')),
            SizedBox(
              width: 20.w,
            ),
            Text(
              controller.userModel?.name ?? '',
              style: GoogleFonts.nunitoSans(),
            ),
            SizedBox(
              width: 20.w,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: controller.clickAvatar,
                child: CircleAvatar(
                  backgroundImage:
                      NetworkImage(controller.userModel?.avatar ?? ''),
                ),
              ),
            )
          ],
        ),
        body: Container(
          color: lightBackgroundColor,
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  color: const Color(0xffF3EDF7),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Expanded(
                        child: ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            itemCount: controller.listSidebar.length,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 50,
                                margin: const EdgeInsets.only(bottom: 10),
                                child: TextButton(
                                  onPressed: () {
                                    controller.changeIndexSidebar(index);
                                  },
                                  style: TextButton.styleFrom(
                                    backgroundColor:
                                        controller.selectIndexSidebar == index
                                            ? const Color(0xffcfbcff)
                                            : Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.r),
                                    ),
                                  ),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      controller.listSidebar[index],
                                      style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
              // Panel kanan / content
              Expanded(
                flex: 24,
                child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: dashboardContent()),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget dashboardContent() {
    if (controller.selectIndexSidebar == 0) {
      // Get.delete<DashboardListNewsController>();
      // return const DashboardHomeWidget();
      return DashboardAddNewsWidget();
    } else if (controller.selectIndexSidebar == 1) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'All News',
            style: GoogleFonts.poppins(fontSize: 18),
          ),
          SizedBox(
            height: 20.h,
          ),
          OutlinedButton.icon(
            onPressed: () {
              Get.dialog(DashboardAddNewsWidget())
                  .whenComplete(() => print('done'));
            },
            icon: const Icon(Icons.add),
            label: const Text('Add News'),
          ),
          const SizedBox(
            height: 20,
          ),
          DashboardListNewsWidget(),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'All Category',
            style: GoogleFonts.poppins(fontSize: 18),
          ),
          SizedBox(
            height: 20.h,
          ),
          OutlinedButton.icon(
            onPressed: () {
              Get.dialog(DashboardAddCategoryWidget())
                  .whenComplete(() => print('done'));
            },
            icon: const Icon(Icons.add),
            label: const Text('Add Category'),
          ),
          const SizedBox(
            height: 20,
          ),
          DashboardListCategoryWidget(),
        ],
      );
    }
  }
}
