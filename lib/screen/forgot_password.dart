import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:telead_e_learning/widget/custom_app_bar.dart';
import 'package:telead_e_learning/widget/custom_button.dart';
import 'package:telead_e_learning/widget/reset_password_card.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Forgot Password'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
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
            ),
            SizedBox(height: 2.h),
            ResetPasswordCard(
              title: 'Via Email',
              content: 'priscilla.frank26@gmail.com',
              icon: Icons.email_outlined,
            ),
            SizedBox(height: 4.h),
            CustomButton(label: 'Continue'),
            SizedBox(height: 7.h),
          ],
        ),
      ),
    );
  }
}
