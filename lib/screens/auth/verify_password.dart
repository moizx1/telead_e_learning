import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';
import 'package:telead_e_learning/widgets/custom_button.dart';
import '../../controllers/auth/verify_password_controller.dart';
import '../../widgets/custom_app_bar.dart';

class VerifyPassword extends StatelessWidget {
  const VerifyPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VerifyPasswordController>(
      init: VerifyPasswordController(),
      builder: (controller) {
        return Scaffold(
          appBar: const CustomAppBar(
            title: 'Forgot Password',
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 9.h),
                const Text(
                    textAlign: TextAlign.center,
                    'Code has been Send to ( +1 ) ***-***-*529'),
                SizedBox(height: 6.h),
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
                controller.enableResend
                    ? GestureDetector(
                        onTap: controller.resendCode,
                        child: const Text(
                          'Resend Code',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff0961F5),
                          ),
                        ),
                      )
                    : RichText(
                        text: TextSpan(
                            text: 'Resend Code in ',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff545454),
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: controller.secondsRemaining.toString(),
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff0961F5),
                                ),
                              ),
                              const TextSpan(
                                text: 's',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff545454),
                                ),
                              ),
                            ]),
                      ),
                SizedBox(height: 8.h),
                CustomButton(
                  label: 'Verify',
                  onPress: controller.onVerifyTap,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
