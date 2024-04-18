import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shbsantri/infrastructure/theme/colors/colors_app.dart';

import 'controllers/login.controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginController>(
          init: LoginController(),
          builder: (controller) {
            return Center(
                child: Container(
              margin: const EdgeInsets.all(20),
              width: Get.width < 600 ? Get.width : 600.w,
              height: 350.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text('Login Admin',
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: lightPrimaryColor,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    const Divider(),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'email@email.com',
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFormField(
                      obscureText: controller.isObscurePassword ? false : true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: '******',
                        suffixIcon: GestureDetector(
                          onTap: () => controller.obscureText(),
                          child: Icon(controller.isObscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    ElevatedButton(
                      onPressed: () {
                        controller.login();
                      },
                      child: const Text('Login'),
                    )
                  ],
                ),
              ),
            ));
          }),
    );
  }
}
