import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telead_e_learning/widget/custom_button.dart';
import 'package:telead_e_learning/widget/list_title.dart';
import 'package:telead_e_learning/widget/mentor_card.dart';
import 'package:telead_e_learning/widget/review_card.dart';

import '../../../../controller/dashboard/home/course/single_course_controller.dart';

class SingleCourseDetails extends StatelessWidget {
  const SingleCourseDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SingleCourseController>(
      init: SingleCourseController(),
      builder: (controller) {
        return MaterialApp(
          home: Scaffold(
            backgroundColor: const Color.fromARGB(255, 237, 244, 255),
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 200.0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      color: Colors.black,
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate.fixed(
                    [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 38.0),
                              child: Stack(
                                clipBehavior: Clip.none,
                                fit: StackFit.passthrough,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        top: 50, bottom: 20),
                                    height: controller.selectedIndex == 0
                                        ? 394
                                        : null,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: Colors.white),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 25.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Graphics Design',
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12,
                                                    color: Color(0xffFF6B00)),
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.star_rounded,
                                                    color: Color(0xffFAC025),
                                                    size: 18,
                                                  ),
                                                  Text(
                                                    '4.2',
                                                    style: const TextStyle(
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xff202244),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 7.5),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 25.0),
                                          child: Text(
                                            'Advanced Graphic Design',
                                            style: const TextStyle(
                                                color: Color(0xff202244),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 25.0),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    const Icon(
                                                      Icons
                                                          .video_camera_back_outlined,
                                                      color: Color(0xff1D1D1B),
                                                      size: 18,
                                                    ),
                                                    Text(
                                                      '21 Class',
                                                      style: const TextStyle(
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Color(0xff202244),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    const Text('|'),
                                                    const SizedBox(width: 10),
                                                    const Icon(
                                                      Icons
                                                          .watch_later_outlined,
                                                      color: Color(0xff1D1D1B),
                                                      size: 18,
                                                    ),
                                                    Text(
                                                      '42 Hours',
                                                      style: const TextStyle(
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Color(0xff202244),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  '\$25',
                                                  style: const TextStyle(
                                                    fontSize: 21,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff0961F5),
                                                  ),
                                                ),
                                              ]),
                                        ),
                                        const SizedBox(height: 7.5),
                                        Container(
                                          height: 52,
                                          decoration: BoxDecoration(
                                            color: const Color(0xffE8F1FF),
                                            border: Border.all(
                                              width: 3,
                                              color: const Color(0xffE8F1FF),
                                            ),
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Expanded(
                                                child: GestureDetector(
                                                  onTap: controller.onAboutTap,
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    color: controller
                                                                .selectedIndex ==
                                                            0
                                                        ? const Color(
                                                            0xffF5F9FF)
                                                        : const Color(
                                                            0xffE8F1FF),
                                                    child: Text(
                                                      'About',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            Color(0xff202244),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: GestureDetector(
                                                  onTap: controller
                                                      .onCurriculumTap,
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    color: controller
                                                                .selectedIndex ==
                                                            1
                                                        ? const Color(
                                                            0xffF5F9FF)
                                                        : const Color(
                                                            0xffE8F1FF),
                                                    child: Text(
                                                      textAlign:
                                                          TextAlign.center,
                                                      'Curriculum',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            Color(0xff202244),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 15),
                                        controller.selectedIndex == 1
                                            ? Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 25),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        RichText(
                                                          text: TextSpan(
                                                            text:
                                                                'Section 01 - ',
                                                            style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: Color(
                                                                  0xff202244),
                                                            ),
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    'Introduction',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: Color(
                                                                      0xff0961F5),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Text('25 Mins',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Color(
                                                                  0xff0961F5),
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 170,
                                                    child: ListView.builder(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 15,
                                                              left: 25,
                                                              right: 25),
                                                      itemCount: 2,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return Column(
                                                          children: [
                                                            InkWell(
                                                              onTap: controller
                                                                  .onCourseTap,
                                                              child: ListTile(
                                                                leading:
                                                                    Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  height: 46,
                                                                  width: 46,
                                                                  decoration: BoxDecoration(
                                                                      color: const Color(
                                                                          0xffF5F9FF),
                                                                      border: Border.all(
                                                                          color: const Color(
                                                                              0xffE8F1FF),
                                                                          width:
                                                                              1.5),
                                                                      shape: BoxShape
                                                                          .circle),
                                                                  child: Text(
                                                                    '01',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color: Color(
                                                                          0xff202244),
                                                                    ),
                                                                  ),
                                                                ),
                                                                title: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Why Using Graphic De..',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        color: Color(
                                                                            0xff202244),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            3),
                                                                    Text(
                                                                      '15 Mins',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        color: Color(
                                                                            0xff545454),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                minLeadingWidth:
                                                                    0,
                                                                trailing: Icon(
                                                                  Icons
                                                                      .play_circle_fill_rounded,
                                                                  color: Color(
                                                                      0xff0961F5),
                                                                  size: 18,
                                                                ),
                                                                contentPadding:
                                                                    EdgeInsets
                                                                        .all(0),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                height: 7.5),
                                                            const Divider(),
                                                            const SizedBox(
                                                                height: 7.5),
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5),
                                                    child: CustomButton(
                                                        label:
                                                            'Enroll Course - \$55'),
                                                  ),
                                                  const SizedBox(height: 15),
                                                ],
                                              )
                                            : Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 25.0),
                                                    child: Text(
                                                        style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Color(0xffA0A4AB),
                                                        ),
                                                        'Graphic Design now a popular profession graphic design by off your carrer about tantas regiones barbarorum pedibus obiit'),
                                                  ),
                                                  const SizedBox(height: 20),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 25.0),
                                                    child: Text(
                                                        style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Color(0xffA0A4AB),
                                                        ),
                                                        'Graphic Design n a popular profession l Cur tantas regiones barbarorum pedibus obiit, maria transmi Et ne nimium beatus est; Addidisti ad extremum etiam Read More'),
                                                  ),
                                                ],
                                              ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: -30,
                                    right: 10,
                                    child: Container(
                                      height: 63,
                                      width: 63,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xff167F71),
                                      ),
                                      child: Icon(
                                        Icons.play_circle_outline,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (controller.selectedIndex == 0)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 20),
                                  Text(
                                    'Instructor',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff202244),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  MentorCard(
                                    name: 'William S. Cunningham',
                                    category: 'Graphic Design',
                                  ),
                                  Text(
                                    'What You’ll Get',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff202244),
                                    ),
                                  ),
                                  ListView.builder(
                                    padding: EdgeInsets.only(left: 0, top: 10),
                                    shrinkWrap: true,
                                    itemCount: 5,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        leading: Icon(Icons.cloud_outlined),
                                        minLeadingWidth: 20,
                                        title: Text(
                                          'Audio Book',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff545454),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 10),
                                  ListTitle(title: 'Reviews'),
                                  const SizedBox(height: 20),
                                  ReviewCard(),
                                  const SizedBox(height: 20),
                                  const Divider(
                                      color: Color.fromARGB(255, 201, 213, 234),
                                      thickness: 1),
                                  const SizedBox(height: 20),
                                  ReviewCard(),
                                  const SizedBox(height: 20),
                                  CustomButton(label: 'Enroll Course - \$55'),
                                  const SizedBox(height: 20),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ],
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
