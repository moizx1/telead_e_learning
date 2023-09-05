import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:telead_e_learning/widgets/custom_app_bar.dart';
import 'package:telead_e_learning/widgets/custom_button.dart';
import 'package:telead_e_learning/widgets/reset_password_card.dart';

import '../../controllers/auth/forgot_password_controller.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPasswordController>(
        init: ForgotPasswordController(),
        builder: (controller) {
          return Scaffold(
            appBar: const CustomAppBar(title: 'Forgot Password'),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    textAlign: TextAlign.center,
                    'Select which contact details should we use to Reset Your Password',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff545454),
                    ),
                  ),
                  SizedBox(height: 3.h),
                  ResetPasswordCard(
                    title: 'Via Email',
                    content: 'priscilla.frank26@gmail.com',
                    icon: Icons.email_outlined,
                    isSelected: controller.onEmailSelect,
                    onTap: controller.toggleEmailSelect,
                  ),
                  SizedBox(height: 2.h),
                  ResetPasswordCard(
                    title: 'Via Sms',
                    content: '( +1 ) 480-894-5529',
                    icon: Icons.email_outlined,
                    isSelected: controller.onSmsSelect,
                    onTap: controller.toggleSmsSelect,
                  ),
                  SizedBox(height: 4.h),
                  CustomButton(
                    label: 'Continue',
                    onPress: controller.onContinueTap,
                  ),
                  SizedBox(height: 7.h),
                ],
              ),
            ),
          );
        });
  }
}
