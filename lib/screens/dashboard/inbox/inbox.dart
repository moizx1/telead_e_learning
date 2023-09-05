import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telead_e_learning/widgets/calls_builder.dart';
import 'package:telead_e_learning/widgets/chats_builder.dart';
import 'package:telead_e_learning/widgets/custom_app_bar.dart';
import 'package:telead_e_learning/widgets/custom_listview_tile.dart';
import 'package:telead_e_learning/widgets/custom_toggle_buttons.dart';

import '../../../controllers/dashboard/inbox/inbox_controller.dart';

class Inbox extends StatelessWidget {
  const Inbox({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InboxController>(
      init: InboxController(),
      builder: (controller) {
        return Scaffold(
          appBar: const CustomAppBar(title: 'Inbox', showSearchIcon: true),
          body: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Column(
              children: [
                CustomToggleButtons(
                  title1: 'Chat',
                  title2: 'Calls',
                  onTap1: controller.chatTabSelect,
                  onTap2: controller.callsTabSelect,
                  currentSelectedCategory: controller.currentSelectedCategory,
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: controller.currentSelectedCategory == 0
                        ? ChatsBuilder(
                            stream: controller.stream,
                            onChatTap: controller.onChatTap,
                            loggedInUser:
                                controller.loggedInUser?.email.toString(),
                          )
                        : CallsBuilder(
                            onTrailingTap: controller.onCallTap,
                          ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
