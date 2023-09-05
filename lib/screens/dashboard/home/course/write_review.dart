import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telead_e_learning/widgets/custom_app_bar.dart';
import 'package:telead_e_learning/widgets/custom_button.dart';
import 'package:telead_e_learning/widgets/mentor_course_card.dart';

import '../../../../controllers/dashboard/home/course/write_review_controller.dart';

class WriteReview extends StatelessWidget {
  const WriteReview({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WriteReviewController>(
        init: WriteReviewController(),
        builder: (controller) {
          return Scaffold(
            appBar: const CustomAppBar(title: 'Write a Review'),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MentorCourseCard(),
                    const SizedBox(height: 15),
                    const Text(
                      'Add Photo (or) Video',
                      style: TextStyle(
                        color: Color(0xff202244),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      height: 134,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.cloud_upload,
                            color: Color(0xff167F71),
                            size: 62,
                          ),
                          Text(
                            'Click here to Upload',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color(0xff545454),
                            ),
                          ),
                          const SizedBox(height: 10)
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Write your Review',
                      style: TextStyle(
                        color: Color(0xff202244),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 10),
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: TextFormField(
                              onChanged: controller.onChanged,
                              keyboardType: TextInputType.multiline,
                              maxLength: 250,
                              maxLines: 9,
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(
                                  color: Color(0xffB4BDC4),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                                hintText:
                                    'Would you like to write anything about this Product?',
                                border: InputBorder.none,
                                counterText: '',
                                counterStyle: TextStyle(fontSize: 0),
                              ),
                            ),
                          ),
                          Text(
                            textAlign: TextAlign.end,
                            '*${controller.reviewWordCount} Characters Remaining',
                            style: const TextStyle(
                              color: Color(0xffB4BDC4),
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 35),
                    CustomButton(label: 'Submit Review')
                  ],
                ),
              ),
            ),
          );
        });
  }
}
