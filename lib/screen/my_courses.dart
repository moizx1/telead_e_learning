import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telead_e_learning/controller/my_courses_controller.dart';
import 'package:telead_e_learning/widget/custom_app_bar.dart';
import 'package:telead_e_learning/widget/custom_search_bar.dart';
import 'package:telead_e_learning/widget/custom_toggle_buttons.dart';

class MyCourses extends StatelessWidget {
  const MyCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyCoursesController>(
        init: MyCoursesController(),
        builder: (controller) {
          return Scaffold(
            appBar: CustomAppBar(title: 'My Courses'),
            body: Column(
              children: [
                CustomSearchBar(
                  hintText: 'Search for...',
                  trailingIcon: Icons.search_rounded,
                ),
                CustomToggleButtons(
                  title1: 'Completed',
                  title2: 'Ongoing',
                  onTap1: controller.onCompletedTap,
                  onTap2: controller.onOngoingTap,
                  currentSelectedCategory: controller.currentSelectedCategory,
                ),
              ],
            ),
          );
        });
  }
}
