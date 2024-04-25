// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shbsantri/presentation/admin/dashboard/controllers/category/category.controller.dart';
import 'package:shbsantri/presentation/admin/widget/category/dashboard_add_category_widget.dart';
import 'package:shbsantri/utils/loading/loading_app.dart';

class DashboardListCategoryWidget extends StatelessWidget {
  DashboardListCategoryWidget({super.key});
  var controller = Get.put(CategoryController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(builder: (controller) {
      return Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            height: Get.height * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.white,
            ),
            child: controller.loading
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
                              'Name Category',
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
                        height: Get.height * 0.69,
                        child: ListView.builder(
                          physics: const ScrollPhysics(),
                          itemCount: controller.categories.length,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                              ),
                              child: ListTile(
                                leading:
                                    Text("${controller.number + index + 1}"),
                                title: Text(
                                    controller.categories[index].name ?? ''),
                                trailing: SizedBox(
                                  width: Get.width * 0.07,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: IconButton(
                                          onPressed: () {
                                            controller.edit(
                                                controller
                                                    .categories[index].id!,
                                                controller
                                                    .categories[index].name!);
                                          },
                                          icon: const Icon(
                                            Icons.edit,
                                            color: Colors.yellow,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      );
    });
  }
}
