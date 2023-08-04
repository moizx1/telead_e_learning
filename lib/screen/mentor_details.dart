import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telead_e_learning/controller/mentor_details_controller.dart';
import 'package:telead_e_learning/widget/custom_app_bar.dart';
import 'package:telead_e_learning/widget/mentor_course_card.dart';
import 'package:telead_e_learning/widget/review_card.dart';

class MentorDetails extends StatelessWidget {
  const MentorDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MentorDetailsController>(
        init: MentorDetailsController(),
        builder: (controller) {
          return Scaffold(
            appBar: CustomAppBar(color: Colors.white),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 30),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          // alignment: Alignment.center,
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(height: 7.5),
                        Text(
                          'Christopher J. Levine',
                          style: TextStyle(
                            color: Color(0xff202244),
                            fontSize: 21,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Graphic Designer At Google',
                          style: TextStyle(
                            color: Color(0xff545454),
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 7.5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '26',
                                  style: TextStyle(
                                    color: Color(0xff202244),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Courses',
                                  style: TextStyle(
                                    color: Color(0xff545454),
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  '15800',
                                  style: TextStyle(
                                    color: Color(0xff202244),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Students',
                                  style: TextStyle(
                                    color: Color(0xff545454),
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  '8750',
                                  style: TextStyle(
                                    color: Color(0xff202244),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Ratings',
                                  style: TextStyle(
                                    color: Color(0xff545454),
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 60,
                              width: 170,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
                                    color: const Color.fromARGB(
                                        255, 220, 229, 242),
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                  color: const Color(0xffE8F1FF)),
                              child: const Center(
                                child: Text(
                                  'Follow',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff202244),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 60,
                              width: 170,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: const Color(0xff0961F5)),
                              child: const Center(
                                child: Text(
                                  'Message',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 17.5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 20,
                          ),
                          child: Text(
                            textAlign: TextAlign.center,
                            'Sed quanta s alias nunc tantum possitne tanta Nec vero sum nescius esse utilitatem in historia non modo voluptatem.',
                            style: TextStyle(
                              color: Color(0xffA0A4AB),
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          height: 52,
                          decoration: BoxDecoration(
                            color: Color(0xffE8F1FF),
                            border: Border.all(
                              width: 3,
                              color: Color(0xffE8F1FF),
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: controller.onCoursesTap,
                                  child: Container(
                                    alignment: Alignment.center,
                                    color: controller.selectedIndex == 0
                                        ? Color(0xffF5F9FF)
                                        : Color(0xffE8F1FF),
                                    child: Text(
                                      'Courses',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff202244),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: controller.onRatingTap,
                                  child: Container(
                                    alignment: Alignment.center,
                                    color: controller.selectedIndex == 1
                                        ? Color(0xffF5F9FF)
                                        : Color(0xffE8F1FF),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      'Rating',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff202244),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        controller.selectedIndex == 1
                            ? ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.all(20),
                                          child: ReviewCard()),
                                      if (index < 3)
                                        const Divider(
                                          color: Color(0xffE8F1FF),
                                        ),
                                    ],
                                  );
                                },
                              )
                            : ListView.builder(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      MentorCourseCard(
                                          name:
                                              'Advance Graphics UI & UX Course'),
                                      if (index < 3)
                                        const Divider(
                                          height: 30,
                                          color: Color(0xffE8F1FF),
                                        ),
                                    ],
                                  );
                                },
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
