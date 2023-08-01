import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sizer/sizer.dart';
import 'package:telead_e_learning/controller/add_profile_info_controller.dart';
import 'package:telead_e_learning/widget/custom_app_bar.dart';
import 'package:telead_e_learning/widget/custom_button.dart';
import 'package:telead_e_learning/widget/custom_text_field.dart';
import 'package:telead_e_learning/widget/profile_image.dart';

import '../widget/custom_dropdown_menu.dart';
import '../widget/custom_phone_field.dart';

class AddProfileInfo extends StatelessWidget {
  const AddProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProfileInfoController>(
        init: AddProfileInfoController(),
        builder: (controller) {
          return Scaffold(
            appBar: const CustomAppBar(
              title: 'Fill Your Profile',
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const ProfileImage(),
                  SizedBox(height: 2.h),
                  CustomTextField(
                    hintText: 'First Name',
                    onChanged: controller.onFirstNameChanged,
                  ),
                  SizedBox(height: 2.h),
                  CustomTextField(
                      hintText: 'Last Name',
                      onChanged: controller.onLastNameChanged),
                  SizedBox(height: 2.h),
                  CustomTextField(
                    controller: controller.dateInput,
                    hintText: 'Date of Birth',
                    prefixIcon: Icons.calendar_month_rounded,
                    isReadOnly: true,
                    onTap: () {
                      controller.selectDate(context);
                    },
                  ),
                  SizedBox(height: 2.h),
                  CustomTextField(
                      hintText: 'Email',
                      prefixIcon: Icons.email_outlined,
                      onChanged: controller.onEmailChanged),
                  SizedBox(height: 2.h),
                  CustomPhoneField(onChanged: controller.onPhoneChanged),
                  CustomDropDown(onChanged: controller.onGenderChanged),
                  SizedBox(height: 5.h),
                  CustomButton(label: 'Continue', onPress: controller.onSave),
                  SizedBox(height: 2.h)
                ],
              ),
            ),
          );
        });
  }
}
