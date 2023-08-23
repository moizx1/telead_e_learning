import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telead_e_learning/controller/notification_setting_controller.dart';
import 'package:telead_e_learning/controller/security_controller.dart';
import 'package:telead_e_learning/widget/custom_app_bar.dart';
import 'package:telead_e_learning/widget/custom_button.dart';
import 'package:telead_e_learning/widget/labelled_switch_row.dart';

class CustomNotificationSettings extends StatelessWidget {
  const CustomNotificationSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationSettingController>(
      init: NotificationSettingController(),
      builder: (controller) {
        return Scaffold(
          appBar: const CustomAppBar(
            title: 'Notification',
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    LabelledSwitchRow(
                      title: 'Special Offers',
                      switchValue: controller.specialOffers.value,
                      switchTap: (newValue) => controller.handleToggle(
                          controller.specialOffers, newValue),
                      // switchEnabled: false,
                    ),
                    const SizedBox(height: 25),
                    LabelledSwitchRow(
                      title: 'Sound',
                      switchValue: controller.sound.value,
                      switchTap: (newValue) =>
                          controller.handleToggle(controller.sound, newValue),
                    ),
                    const SizedBox(height: 25),
                    LabelledSwitchRow(
                      title: 'Vibrate',
                      switchValue: controller.vibrate.value,
                      switchTap: (newValue) =>
                          controller.handleToggle(controller.vibrate, newValue),
                      switchEnabled: false,
                    ),
                    const SizedBox(height: 25),
                    LabelledSwitchRow(
                      title: 'General Notification',
                      switchValue: controller.generalNotification.value,
                      switchTap: (newValue) => controller.handleToggle(
                          controller.generalNotification, newValue),
                    ),
                    const SizedBox(height: 25),
                    LabelledSwitchRow(
                      title: 'Promo & Discount',
                      switchValue: controller.promo.value,
                      switchTap: (newValue) =>
                          controller.handleToggle(controller.promo, newValue),
                      switchEnabled: false,
                    ),
                    const SizedBox(height: 25),
                    LabelledSwitchRow(
                      title: 'Payment Options',
                      switchValue: controller.paymentOptions.value,
                      switchTap: (newValue) => controller.handleToggle(
                          controller.paymentOptions, newValue),
                    ),
                    const SizedBox(height: 25),
                    LabelledSwitchRow(
                      title: 'App Update',
                      switchValue: controller.appUpdate.value,
                      switchTap: (newValue) => controller.handleToggle(
                          controller.appUpdate, newValue),
                    ),
                    const SizedBox(height: 25),
                    LabelledSwitchRow(
                      title: 'New Service Available',
                      switchValue: controller.newService.value,
                      switchTap: (newValue) => controller.handleToggle(
                          controller.newService, newValue),
                      switchEnabled: false,
                    ),
                    const SizedBox(height: 25),
                    LabelledSwitchRow(
                      title: 'New Tips Available',
                      switchValue: controller.newTips.value,
                      switchTap: (newValue) =>
                          controller.handleToggle(controller.newTips, newValue),
                      switchEnabled: false,
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
