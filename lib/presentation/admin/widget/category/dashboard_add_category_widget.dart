import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shbsantri/presentation/admin/dashboard/controllers/category/category.controller.dart';

class DashboardAddCategoryWidget extends StatelessWidget {
  DashboardAddCategoryWidget({super.key});
  var controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: GetBuilder<CategoryController>(
          init: CategoryController(),
          builder: (controller) {
            return SizedBox(
              width: 500,
              height: 300,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      Text(
                        controller.isEdit ? 'Edit Category' : 'Add Category',
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Category Name',
                        ),
                        controller: controller.nameController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 100,
                            height: 32,
                            child: OutlinedButton(
                              onPressed: () {
                                if (controller.isEdit) {
                                  controller.saveCategory();
                                } else {
                                  controller.updateCategory();
                                }
                              },
                              child: const Text('Save'),
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            height: 32,
                            child: OutlinedButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text('Close'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
