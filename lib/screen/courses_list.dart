import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telead_e_learning/controller/course_list_controller.dart';
import 'package:telead_e_learning/widget/custom_app_bar.dart';
import 'package:telead_e_learning/widget/custom_search_bar.dart';
import 'package:telead_e_learning/widget/home_course_card.dart';
import 'package:telead_e_learning/widget/list_title.dart';

import '../widget/course_cards.dart';

class CoursesList extends StatelessWidget {
  const CoursesList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CourseListController>(
      init: CourseListController(),
      builder: (controller) {
        return Scaffold(
          appBar: const CustomAppBar(title: 'Online Courses'),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Column(
              children: [
                const CustomSearchBar(
                  hintText: 'Graphics Design...',
                  showLeadingIcon: true,
                  trailingIcon: Icons.filter_rounded,
                ),
                const SizedBox(height: 25),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // const SizedBox(),
                    Expanded(
                      child: GestureDetector(
                        // onTap: () => onTap(index),
                        child: Container(
                          height: 48,
                          // width: 170,
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          decoration: BoxDecoration(
                              // color: index == currentIndex
                              //     ? const Color(0xff167F71)
                              //     : const Color(0xffE8F1FF),
                              color: const Color(0xffE8F1FF),
                              borderRadius: BorderRadius.circular(20)),
                          alignment: Alignment.center,
                          // margin: const EdgeInsets.only(right: 15),
                          child: const Text(
                            'Courses',
                            // items[index],
                            style: TextStyle(
                              // color: index == currentIndex
                              //     ? Colors.white
                              //     : const Color(0xff202244),
                              color:  Color(0xff202244),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: GestureDetector(
                        // onTap: () => onTap(index),
                        child: Container(
                          height: 48,
                          // width: 170,
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          decoration: BoxDecoration(
                              // color: index == currentIndex
                              //     ? const Color(0xff167F71)
                              //     : const Color(0xffE8F1FF),
                              color: const Color(0xffE8F1FF),
                              borderRadius: BorderRadius.circular(20)),
                          alignment: Alignment.center,
                          // margin: const EdgeInsets.only(right: 15),
                          child: const Text(
                            'Mentors',
                            // items[index],
                            style: TextStyle(
                              // color: index == currentIndex
                              //     ? Colors.white
                              //     : const Color(0xff202244),
                              color:  Color(0xff202244),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // const SizedBox()
                  ],
                ),
                const SizedBox(height: 15),
                ListTitle(
                  title: 'Result for "Graphics Design"',
                  trailingText: '2480 FOUNDS >',
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 20),
                    scrollDirection: Axis.vertical,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: CourseCards.CourseCard(
                          category: 'Graphics Design',
                          courseCode: 7385,
                          name: 'Advanced Graphics Design',
                          price: 28,
                          rating: 4.2,
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          //   bottomNavigationBar: BottomNavigationBar(
          //       backgroundColor: Color(0xffF5F9FF),
          //       // useLegacyColorScheme: true,
          //       items: const <BottomNavigationBarItem>[
          //         BottomNavigationBarItem(
          //           icon: Icon(Icons.home_rounded, color: Color(0xff202244)),
          //           label: 'Home',
          //           // backgroundColor: Colors.green
          //         ),
          //         BottomNavigationBarItem(
          //           icon: Icon(Icons.edit_document, color: Color(0xff202244)),
          //           label: 'Search',
          //           // backgroundColor: Colors.yellow
          //         ),
          //         BottomNavigationBarItem(
          //           icon: Icon(Icons.person, color: Color(0xff202244)),
          //           label: 'Profile',
          //           // backgroundColor: Colors.blue,
          //         ),
          //       ],
          //       type: BottomNavigationBarType.shifting,
          //       // currentIndex: _selectedIndex,
          //       selectedItemColor: Colors.black,

          //       // iconSize: 40,
          //       // onTap: _onItemTapped,
          //       elevation: 5),
        );
      },
    );
  }
}
