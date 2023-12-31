import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telead_e_learning/widgets/custom_app_bar.dart';
import 'package:telead_e_learning/widgets/custom_button.dart';
import 'package:telead_e_learning/widgets/labelled_switch_row.dart';

import '../../../controllers/dashboard/profile/security_controller.dart';

class Security extends StatelessWidget {
  const Security({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SecurityController>(
      init: SecurityController(),
      builder: (controller) {
        return Scaffold(
          appBar: const CustomAppBar(
            title: 'Security',
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    LabelledSwitchRow(
                      title: 'Remember Me',
                      switchValue: controller.rememberMe.value,
                      switchTap: (newValue) => controller.handleToggle(
                          controller.rememberMe, newValue),
                    ),
                    const SizedBox(height: 25),
                    LabelledSwitchRow(
                      title: 'Biometric ID',
                      switchValue: controller.biometric.value,
                      switchTap: (newValue) => controller.handleToggle(
                          controller.biometric, newValue),
                    ),
                    const SizedBox(height: 25),
                    LabelledSwitchRow(
                      title: 'Face ID',
                      switchValue: controller.faceId.value,
                      switchTap: (newValue) =>
                          controller.handleToggle(controller.faceId, newValue),
                    ),
                    const SizedBox(height: 35),
                    GestureDetector(
                      onTap: () {},
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Google Authenticator',
                            style: TextStyle(
                              color: Color(0xff202244),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios_rounded, size: 24),
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(255, 212, 215, 218),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Center(
                          child: Text(
                            'Change Pin',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff202244),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    CustomButton(label: 'Change Password'),
                    const SizedBox(height: 25),
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
