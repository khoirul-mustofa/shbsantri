import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shbsantri/domain/core/models/category_model.dart';
import 'package:shbsantri/infrastructure/theme/colors/colors_app.dart';
import 'package:shbsantri/presentation/admin/dashboard/controllers/news/dashboard.add.news.controller.dart';

class DashboardAddNewsWidget extends StatelessWidget {
  DashboardAddNewsWidget({super.key});
  DashboardAddNewsController controller = Get.put(DashboardAddNewsController());
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: GetBuilder<DashboardAddNewsController>(builder: (controller) {
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Add News',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        const Spacer(),
                        const SizedBox(width: 20),
                        IconButton(
                          tooltip: 'Close',
                          onPressed: () {
                            Get.defaultDialog(
                              title: 'Close',
                              middleText:
                                  'Batalkan penambahan berita & keluar ?',
                              textConfirm: 'Yes',
                              textCancel: 'No',
                              onConfirm: () {
                                Get.back();
                                Get.back();
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                        ),
                        const SizedBox(width: 20)
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: Colors.grey.shade100,
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                controller.imagePicker();
                              },
                              child: controller.imageBytes == null
                                  ? Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey.shade300,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      width: 200,
                                      height: 200,
                                      child: Icon(
                                        Icons.add_a_photo,
                                        color: Colors.grey.shade500,
                                        size: 30,
                                      ),
                                    )
                                  : Image.memory(
                                      controller.imageBytes!,
                                      width: 200,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          const UploduFIleWidget(),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: Get.width * 0.98,
                            height: 100,
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8.0.r),
                                        ),
                                      ),
                                      labelText: 'Judul Berita',
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 54,
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius:
                                            BorderRadius.circular(6.r)),
                                    child: DropdownButton<CategoryModel>(
                                      hint: const Text('Select Category'),
                                      value: controller.selectedCategory,
                                      isExpanded: true,
                                      underline: const SizedBox.shrink(),
                                      onChanged: (CategoryModel? value) {
                                        controller.setSelectCategory(value!);
                                      },
                                      items: controller.categories
                                          .map<DropdownMenuItem<CategoryModel>>(
                                              (CategoryModel category) {
                                        return DropdownMenuItem<CategoryModel>(
                                          value: category,
                                          child: Text(category.name ?? ''),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: SingleChildScrollView(
                              physics: const ScrollPhysics(),
                              child: Column(
                                children: [
                                  QuillToolbar.simple(
                                    configurations:
                                        QuillSimpleToolbarConfigurations(
                                      controller: controller.htmlController,
                                      sharedConfigurations:
                                          const QuillSharedConfigurations(
                                              locale: Locale('id')),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Container(
                                    height: 800.h,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        border: Border.all(
                                          color: Colors.grey,
                                        )),
                                    child: QuillEditor.basic(
                                      configurations: QuillEditorConfigurations(
                                        padding: const EdgeInsets.all(20),
                                        controller: controller.htmlController,
                                        readOnly: false,
                                        sharedConfigurations:
                                            const QuillSharedConfigurations(
                                                locale: Locale('id')),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    color: Colors.black),
                child: IconButton(
                  tooltip: 'Save',
                  onPressed: () {},
                  icon: Icon(
                    Icons.save,
                    color: Colors.green.shade700,
                  ),
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}

class UploduFIleWidget extends StatelessWidget {
  const UploduFIleWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardAddNewsController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                height: 24,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: lightBackgroundColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10)),
                    onPressed: () {
                      controller.pptPicker();
                    },
                    child: Text(
                      'upload Ppt',
                      style: GoogleFonts.poppins(),
                    )),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: Get.width * 0.6,
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  controller.pptName ?? 'no file',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: lightPrimaryFontColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              SizedBox(
                height: 24,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: lightBackgroundColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10)),
                    onPressed: () {
                      controller.pdfPicker();
                    },
                    child: Text(
                      'upload Pdf',
                      style: GoogleFonts.poppins(),
                    )),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: Get.width * 0.6,
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  controller.pdfName ?? 'no file',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: lightPrimaryFontColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}
