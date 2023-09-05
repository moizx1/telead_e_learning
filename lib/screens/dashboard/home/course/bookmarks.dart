import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:telead_e_learning/widgets/custom_app_bar.dart';
import 'package:telead_e_learning/widgets/custom_horizontal_list.dart';
import '../../../../controllers/dashboard/home/course/bookmarks_controller.dart';
import '../../../../widgets/course_cards.dart';
import '../../../../widgets/custom_button.dart';

class Bookmarks extends StatelessWidget {
  const Bookmarks({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookmarksController>(
        init: BookmarksController(),
        builder: (controller) {
          return DefaultTabController(
            initialIndex: 1,
            length: 3,
            child: Scaffold(
              appBar: const CustomAppBar(
                title: 'My Bookmark',
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
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 28),
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
                            onBookmarkTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25, vertical: 30),
                                    height: 368,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        const Text(
                                          textAlign: TextAlign.center,
                                          'Remove From Bookmark?',
                                          style: TextStyle(
                                            color: Color(0xff202244),
                                            fontSize: 21,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 25),
                                        CourseCards.CourseCard(
                                          category: 'Graphics Design',
                                          courseCode: 7385,
                                          name: 'Advanced Graphics Design',
                                          price: 28,
                                          rating: 4.2,
                                        ),
                                        const SizedBox(height: 30),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              height: 60,
                                              width: 16.h,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    width: 2,
                                                    color: const Color.fromARGB(
                                                        255, 220, 229, 242),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  color:
                                                      const Color(0xffE8F1FF)),
                                              child: const Center(
                                                child: Text(
                                                  'Cancel',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xff202244),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 1.h,
                                            ),
                                            CustomButton(
                                                label: 'Yes, Remove',
                                                width: 23.h,
                                                isTextCenter: false),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
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
