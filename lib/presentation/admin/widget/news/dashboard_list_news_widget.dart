import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shbsantri/infrastructure/navigation/routes.dart';
import 'package:shbsantri/presentation/admin/dashboard/controllers/news/dashboard.list.news.controller.dart';
import 'package:shbsantri/utils/loading/loading_app.dart';

// ignore: must_be_immutable
class DashboardListNewsWidget extends StatelessWidget {
  DashboardListNewsWidget({super.key});
  var controller = Get.put(DashboardListNewsController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardListNewsController>(builder: (controller) {
      return Container(
        padding: const EdgeInsets.all(20),
        height: Get.height * 0.7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white,
        ),
        child: controller.isloadingScreen
            ? const LoadingApp()
            : Column(
                children: [
                  SizedBox(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'No',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'Title',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'Actions',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 50.w,
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  SizedBox(
                    height: Get.height * 0.50,
                    child: ListView.builder(
                      physics: const ScrollPhysics(),
                      itemCount: controller.news.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.DETAIL_NEWS,
                                arguments: controller.news[index]);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey.shade300,
                                ),
                              ),
                            ),
                            child: ListTile(
                              leading: Text("${controller.number + index + 1}"),
                              title: Text(controller.news[index].title ?? ''),
                              trailing: SizedBox(
                                width: Get.width * 0.07,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.edit,
                                          color: Colors.yellow,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Expanded(
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Visibility(
                          visible: controller.newsModel?.previousPage != null
                              ? true
                              : false,
                          child: OutlinedButton(
                            onPressed: () {
                              controller.previousPage();
                            },
                            child: const Icon(Icons.chevron_left),
                          ),
                        ),
                        OutlinedButton(
                          style: ButtonStyle(
                            enableFeedback: false,
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                          ),
                          onPressed: () {},
                          child: Text(controller.newsModel?.page.toString() ??
                              0.toString()),
                        ),
                        Visibility(
                          visible: controller.newsModel?.nextPage != null
                              ? true
                              : false,
                          child: OutlinedButton(
                            onPressed: () {
                              controller.nextPage();
                            },
                            child: const Icon(Icons.chevron_right),
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Text(
                          'pages  ${controller.newsModel?.totalPages.toString()}',
                          style: GoogleFonts.poppins(
                              fontSize: 18, color: const Color(0xff6952A5)),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      );
    });
  }
}
