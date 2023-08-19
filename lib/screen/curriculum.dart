import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telead_e_learning/controller/curriculum_controller.dart';
import 'package:telead_e_learning/widget/custom_app_bar.dart';
import '../widget/custom_button.dart';

class Curriculum extends StatelessWidget {
  Curriculum({super.key});

  final List<CourseSection> courseSections = CourseData.generateDummyData();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CurriculumController>(
        init: CurriculumController(),
        builder: (controller) {
          return Scaffold(
            appBar: const CustomAppBar(title: 'Curriculum'),
            body: Padding(
              padding: const EdgeInsets.only(bottom: 30, left: 28, right: 28),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: courseSections.length - 1,
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              '${courseSections[index].title} - ',
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Introduction',
                                              style: const TextStyle(
                                                color: Color(0xff0961F5),
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '25 Mins',
                                          style: TextStyle(
                                            color: Color(0xff0961F5),
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount:
                                        courseSections[index].videos.length,
                                    itemBuilder: (context, newIndex) {
                                      return Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(15),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      height: 46,
                                                      width: 46,
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xffF5F9FF),
                                                        border: Border.all(
                                                          width: 2,
                                                          color: const Color(
                                                              0xffE8F1FF),
                                                        ),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Text(
                                                        (newIndex + 1)
                                                            .toString(),
                                                        style: const TextStyle(
                                                            color: Color(
                                                                0xff202244),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          courseSections[index]
                                                              .videos[newIndex]
                                                              .title,
                                                          style:
                                                              const TextStyle(
                                                            color: Color(
                                                                0xff202244),
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                        Text(
                                                          courseSections[index]
                                                              .videos[newIndex]
                                                              .time,
                                                          style:
                                                              const TextStyle(
                                                            color: Color(
                                                                0xff545454),
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                InkWell(
                                                  onTap: controller.onLessonTap,
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    height: 28,
                                                    width: 28,
                                                    decoration:
                                                        const BoxDecoration(
                                                            color: Color(
                                                                0xff0961F5),
                                                            shape: BoxShape
                                                                .circle),
                                                    child: const Icon(
                                                        Icons.arrow_right,
                                                        color: Colors.white,
                                                        size: 18),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Divider(
                                              color: Color(0xffE8F1FF)),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: -10,
                    left: 4,
                    right: 4,
                    child: CustomButton(
                      label: "Enroll Course - \$55",
                      onPress: controller.onEnrollTap,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class CourseData {
  static List<CourseSection> generateDummyData() {
    List<CourseSection> courseSections = [];

    for (int i = 1; i <= 5; i++) {
      List<Video> sectionVideos = [];
      for (int j = 1; j <= 4; j++) {
        sectionVideos.add(
          Video(
            'Video $j in Section $i',
            '15 Mins',
            'video_url_${i}_$j',
          ),
        );
      }
      courseSections.add(
        CourseSection(
          'Section $i',
          sectionVideos,
        ),
      );
    }

    return courseSections;
  }
}

class CourseSection {
  final String title;
  final List<Video> videos;

  CourseSection(this.title, this.videos);
}

class Video {
  final String title, time;
  final String? videoUrl;

  Video(this.title, this.time, this.videoUrl);
}
