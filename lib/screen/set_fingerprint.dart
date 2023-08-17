import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:telead_e_learning/widget/custom_button.dart';
import 'package:telead_e_learning/widget/custom_alert.dart';
import '../controller/create_new_pin_controller.dart';
import '../controller/set_fingerprint_controller.dart';
import '../widget/custom_app_bar.dart';

class SetFingerprint extends StatelessWidget {
  const SetFingerprint({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SetFingerprintController>(
      init: SetFingerprintController(),
      builder: (controller) {
        return Scaffold(
          appBar: const CustomAppBar(
            title: 'Set Your Fingerprint',
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 6.h),
                const Text(
                  textAlign: TextAlign.center,
                  'Add a Fingerprint to Make your Account more Secure',
                ),
                SizedBox(height: 9.h),
                Stack(alignment: Alignment.center, children: [
                  Image.asset('assets/images/fingerprint1.png'),
                  Image.asset('assets/images/fingerprint2.png'),
                ]),
                SizedBox(height: 9.h),
                const Text(
                  textAlign: TextAlign.center,
                  'Please Put Your Finger on the Fingerprint Scanner to get Started.',
                ),
                SizedBox(height: 9.h),
                Row(
                  children: [
                    Container(
                      height: 60,
                      width: 16.h,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: const Color.fromARGB(255, 220, 229, 242),
                          ),
                          borderRadius: BorderRadius.circular(30),
                          color: const Color(0xffE8F1FF)),
                      child: const Center(
                          child: Text(
                        'Skip',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff202244),
                        ),
                      )),
                    ),
                    SizedBox(
                      width: 2.h,
                    ),
                    GestureDetector(
                      onTap:
                          // showDialog(
                          //   context: context,
                          //   builder: (context) {
                          //     return CustomAlert.accountReady();
                          //   },
                          // );
                          controller.onContinueTap,
                      child: CustomButton(
                          label: 'Continue',
                          width: 21.h,
                          isTextCenter: false,
                          onPress: controller.onContinueTap),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
