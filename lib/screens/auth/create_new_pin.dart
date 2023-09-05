import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';
import 'package:telead_e_learning/widgets/custom_button.dart';

import '../../controllers/auth/create_new_pin_controller.dart';
import '../../widgets/custom_app_bar.dart';

class CreateNewPin extends StatelessWidget {
  const CreateNewPin({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateNewPinController>(
      init: CreateNewPinController(),
      builder: (controller) {
        return Scaffold(
          appBar: const CustomAppBar(
            title: 'Create New Pin',
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 9.h),
                const Text(
                    textAlign: TextAlign.center,
                    'Add a Pin Number to Make Your Account more Secure'),
                SizedBox(height: 9.h),
                Pinput(
                  obscureText: true,
                  focusedPinTheme: PinTheme(
                    width: 75,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            color: const Color.fromARGB(255, 135, 141, 146)
                                .withOpacity(0.06),
                            offset: const Offset(0, 0),
                            blurRadius: 2,
                            spreadRadius: 3.5)
                      ],
                    ),
                  ),
                  defaultPinTheme: PinTheme(
                    width: 75,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                 CustomButton(label: 'Continue',onPress: controller.onContinueTap,)
              ],
            ),
          ),
        );
      },
    );
  }
}
