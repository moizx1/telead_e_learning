import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telead_e_learning/widget/course_cards.dart';
import 'package:telead_e_learning/widget/custom_app_bar.dart';
import 'package:telead_e_learning/widget/custom_search_bar.dart';
import 'package:telead_e_learning/widget/custom_toggle_buttons.dart';

import '../../../controller/dashboard/my_courses/my_courses_controller.dart';

class MyCourses extends StatelessWidget {
  const MyCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyCoursesController>(
        init: MyCoursesController(),
        builder: (controller) {
          return Scaffold(
            appBar: const CustomAppBar(title: 'My Courses'),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const CustomSearchBar(
                    hintText: 'Search for...',
                    trailingIcon: Icons.search_rounded,
                  ),
                  const SizedBox(height: 20),
                  CustomToggleButtons(
                    title1: 'Completed',
                    title2: 'Ongoing',
                    onTap1: controller.onCompletedTap,
                    onTap2: controller.onOngoingTap,
                    currentSelectedCategory: controller.currentSelectedCategory,
                  ),
                  const SizedBox(height: 15),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: controller.currentSelectedCategory == 0
                              ? InkWell(
                                onTap: controller.onCompletedCourseTap,
                                child: CourseCards.CompletedCourseCard(
                                    category: 'Graphics Design',
                                    name: 'Graphic Design Advanced',
                                    rating: 4.3),
                              )
                              : InkWell(
                                onTap: controller.onOngoingCourseTap,
                                child: CourseCards.OngoingCourseCard(
                                    category: 'Graphics Design',
                                    name: 'Graphic Design Advanced',
                                    rating: 4.2,
                                    remaining: 78,
                                    total: 124,
                                  ),
                              ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
