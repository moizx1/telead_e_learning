import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telead_e_learning/widget/custom_app_bar.dart';
import 'package:telead_e_learning/widget/custom_checkbox.dart';

import '../controller/filter_courses_controller.dart';

class FilterCourses extends StatelessWidget {
  const FilterCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilterCoursesController>(
        init: FilterCoursesController(),
        builder: (controller) {
          return Scaffold(
            appBar: CustomAppBar(
              title: 'Filter',
              trailing: GestureDetector(
                child: const Text(
                  'Clear',
                  style: TextStyle(
                    color: Color(0xff545454),
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            body: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              itemCount: controller.filteredList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.filteredList[index].title ?? '',
                      style: const TextStyle(
                        color: Color(0xff202244),
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    ListView.builder(
                      padding: const EdgeInsets.only(
                          top: 5, bottom: 10, left: 10, right: 10),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          controller.filteredList[index].elements?.length,
                      itemBuilder: (context, nextIndex) {
                        return Row(
                          children: [
                            CustomCheckBox.square(
                                isChecked: controller.filteredList[index]
                                    .elements?[nextIndex].isChecked as bool,
                                onChanged: (value) {
                                  controller.onChange(value, index, nextIndex);
                                }),
                            Text(
                              controller
                                  .filteredList[index].elements![nextIndex].name
                                  .toString(),
                              style: const TextStyle(
                                color: Color(0xff202244),
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        );
                      },
                    )
                  ],
                );
              },
            ),
          );
        });
  }
}
