import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telead_e_learning/widget/custom_app_bar.dart';
import 'package:telead_e_learning/widget/custom_horizontal_list.dart';

import '../controller/popular_courses_controller.dart';
import '../widget/popular_course_card.dart';

class PopularCourses extends StatelessWidget {
  const PopularCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PopularCoursesController>(
        init: PopularCoursesController(),
        builder: (controller) {
          return DefaultTabController(
            initialIndex: 1,
            length: 3,
            child: Scaffold(
              appBar: const CustomAppBar(
                title: 'Popular Courses',
                showSearchIcon: true,
              ),
              body: Column(
                children: [
                  CustomHorizontalList(
                    currentIndex: controller.currentSelectedCategory,
                    onTap: controller.onCategoryTap,
                    titles: [
                      'All',
                      'Graphics Design',
                      '3D Design',
                      'Arts & Humanities',
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return PopularCourseCard(
                        category: 'Graphics Design',
                      );
                    },
                  )
                ],
              ),
            ),
          );
        });
  }
}
