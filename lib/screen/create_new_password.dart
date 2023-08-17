import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sizer/sizer.dart';
import 'package:telead_e_learning/controller/add_profile_info_controller.dart';
import 'package:telead_e_learning/widget/custom_app_bar.dart';
import 'package:telead_e_learning/widget/custom_button.dart';
import 'package:telead_e_learning/widget/custom_text_field.dart';
import 'package:telead_e_learning/widget/profile_image.dart';

import '../controller/create_new_password_controller.dart';
import '../widget/custom_dropdown_menu.dart';
import '../widget/custom_phone_field.dart';

class CreateNewPassword extends StatelessWidget {
  const CreateNewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateNewPasswordController>(
        init: CreateNewPasswordController(),
        builder: (controller) {
          return Scaffold(
            appBar: const CustomAppBar(
              title: 'Fill Your Profile',
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Create Your New Password',
                    style: TextStyle(
                        color: Color(0xff202244),
                        fontSize: 19,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 3.h),
                  CustomTextField(
                    hintText: 'Password',
                    prefixIcon: Icons.lock_outline_rounded,
                    suffixIcon: controller.isTextVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    isObsecure: controller.isTextVisible,
                    onSuffixPress: controller.toggleVisibility,
                  ),
                  SizedBox(height: 2.h),
                  CustomTextField(
                    hintText: 'Password',
                    prefixIcon: Icons.lock_outline_rounded,
                    suffixIcon: controller.isTextVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    isObsecure: controller.isTextVisible,
                    onSuffixPress: controller.toggleVisibility,
                  ),
                  SizedBox(height: 5.h),
                  CustomButton(
                    label: 'Continue',
                    onPress: controller.onContinueTap,
                  ),
                  SizedBox(height: 7.h)
                ],
              ),
            ),
          );
        });
  }
}
