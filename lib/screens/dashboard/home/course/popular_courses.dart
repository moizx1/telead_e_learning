import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telead_e_learning/widgets/custom_app_bar.dart';
import 'package:telead_e_learning/widgets/custom_horizontal_list.dart';

import '../../../../controllers/dashboard/home/course/popular_courses_controller.dart';
import '../../../../widgets/course_cards.dart';

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
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0),
                    child: CustomHorizontalList(
                      currentIndex: controller.currentSelectedCategory,
                      onTap: controller.onCategoryTap,
                      titles: [
                        'All',
                        'Graphics Design',
                        '3D Design',
                        'Arts & Humanities',
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 28),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: CourseCards.CourseCard(
                            category: 'Graphics Design',
                            courseCode: 7385,
                            name: 'Advanced Graphics Design',
                            price: 28,
                            rating: 4.2,
                            onCourseTap: controller.onCourseTap,
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
