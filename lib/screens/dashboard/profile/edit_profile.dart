import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:telead_e_learning/widgets/custom_app_bar.dart';
import 'package:telead_e_learning/widgets/custom_button.dart';
import 'package:telead_e_learning/widgets/custom_text_field.dart';
import 'package:telead_e_learning/widgets/profile_image.dart';

import '../../../controllers/dashboard/profile/edit_profile_controller.dart';
import '../../../widgets/custom_dropdown_menu.dart';
import '../../../widgets/custom_phone_field.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileController>(
      init: EditProfileController(),
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
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
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
                        SizedBox(height: 2.h),
                        CustomTextField(
                          hintText: 'Student',
                          onChanged: controller.onFirstNameChanged,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
                CustomButton(label: 'Continue', onPress: controller.onSave),
                SizedBox(height: 2.h)
              ],
            ),
          ),
        );
      },
    );
  }
}
