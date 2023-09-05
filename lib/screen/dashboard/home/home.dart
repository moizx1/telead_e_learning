import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telead_e_learning/widget/custom_horizontal_list.dart';
import 'package:telead_e_learning/widget/list_title.dart';
import 'package:telead_e_learning/widget/home_course_card.dart';
import 'package:telead_e_learning/widget/custom_search_bar.dart';
import 'package:telead_e_learning/widget/offers_card.dart';

import '../../../controller/dashboard/home/home_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hi, Ronald A. Martin',
                                style: TextStyle(
                                    color: Color(0xff202244),
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500),
                              ),
                              Container(
                                width: 220,
                                child: Wrap(
                                  children: [
                                    Text(
                                      'What Would you like to learn Today? Search Below.',
                                      style: TextStyle(
                                          color: Color(0xff545454),
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: controller.onNotificationTap,
                            icon: Icon(
                              Icons.notifications_none_rounded,
                              size: 30,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 40),
                      CustomSearchBar(
                          onTap: controller.onSearchTap,
                          showLeadingIcon: true,
                          hintText: 'Search For...',
                          trailingIcon: Icons.filter_list),
                      const SizedBox(height: 30),
                      const OffersCard(percentage: 25),
                      const SizedBox(height: 30),
                      ListTitle(
                        title: 'Categories',
                        onTap: controller.onAllCategoryTap,
                      ),
                      Container(
                        // alignment: Alignment.center,
                        height: 40,
                        child: ListView.builder(
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            List items = [
                              '3D Design',
                              'Arts & Humanities',
                              'Graphics Design'
                            ];
                            return GestureDetector(
                              onTap: () {
                                controller.onCategoryTap(index);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(right: 25),
                                child: Text(
                                  items[index],
                                  style: TextStyle(
                                    color: index ==
                                            controller.currentSelectedCategory
                                        ? const Color(0xff0961F5)
                                        : const Color(0xffA0A4AB),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 25),
                      ListTitle(
                          title: 'Popular Courses',
                          onTap: controller.onPopularCoursesTap),
                      const SizedBox(height: 10),
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
                      // Container(
                      //   // alignment: Alignment.center,
                      //   height: 40,
                      //   child: ListView.builder(
                      //     itemCount: 3,
                      //     scrollDirection: Axis.horizontal,
                      //     itemBuilder: (context, index) {
                      //       List items = [
                      // 'All',
                      // 'Graphics Design',
                      // '3D Design',
                      // 'Arts & Humanities',
                      //       ];
                      //       return GestureDetector(
                      //         onTap: () {
                      //           controller.onCategoryTap(controller.categoryIndex);
                      //         },
                      //         child: Container(
                      //           height: 30,
                      //           // width: 58,
                      //           padding:
                      //               const EdgeInsets.symmetric(horizontal: 25),
                      //           decoration: BoxDecoration(
                      //               color: index ==
                      //                       controller.currentSelectedCategory
                      //                   ? const Color(0xff167F71)
                      //                   : const Color(0xffE8F1FF),
                      //               borderRadius: BorderRadius.circular(20)),
                      //           alignment: Alignment.center,
                      //           margin: const EdgeInsets.only(right: 15),
                      //           child: Text(
                      //             items[index],
                      //             style: TextStyle(
                      //               color: index ==
                      //                       controller.currentSelectedCategory
                      //                   ? Colors.white
                      //                   : const Color(0xff202244),
                      //               fontWeight: FontWeight.bold,
                      //               fontSize: 15,
                      //             ),
                      //           ),
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),
                      SizedBox(
                        height: 252,
                        // padding: EdgeInsets.only(right: 18),
                        child: ListView.builder(
                          shrinkWrap: true,
                          //
                          itemCount: 2,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(
                                  left: index == 0 ? 0 : 8.0,
                                  top: 17.5,
                                  bottom: 0,
                                  right: 8),
                              child: const HomeCourseCard(
                                category: 'Graphics Design',
                                name: 'Graphics Design Advanced',
                                price: 28,
                                rating: 4.2,
                                courseCode: 7830,
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 25),
                      ListTitle(
                        title: 'Top Mentor',
                        onTap: controller.onTopMentorsTap,
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            List items = [
                              '3D Design',
                              'Arts & Humanities',
                              'Graphics Design'
                            ];
                            return GestureDetector(
                              onTap: () {},
                              child: Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(right: 25),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 70,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 7.5,
                                    ),
                                    Text(
                                      items[index],
                                      style: const TextStyle(
                                        color: Color(0xff202244),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
