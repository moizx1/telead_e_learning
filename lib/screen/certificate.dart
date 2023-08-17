import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:telead_e_learning/widget/custom_button.dart';
import 'package:telead_e_learning/widget/custom_search_bar.dart';

import '../widget/custom_app_bar.dart';

class Certificate extends StatelessWidget {
  const Certificate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: '3D Design Illustration',
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SizedBox(
              height: 70.h,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: CustomSearchBar(
                        hintText: '3D Design Illustration',
                        trailingIcon: Icons.search),
                  ),
                  Expanded(
                    child: Container(
                      margin:
                          const EdgeInsets.only(left: 18, right: 18, top: 20),
                      padding: const EdgeInsets.only(
                          top: 120, left: 40, right: 40, bottom: 40),
                      height: 560,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/certificate.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'Certificate of Completions',
                                  style: const TextStyle(
                                    color: Color(0xff202244),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(height: 1.h),
                                Text(
                                  'This Certifies that',
                                  style: const TextStyle(
                                    color: Color(0xff545454),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                                SizedBox(height: 1.h),
                                Text(
                                  'Calvin E. McGinnis',
                                  style: const TextStyle(
                                    color: Color(0xff332DA1),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(height: 0.75.h),
                                Text(
                                  'Has Successfully Completed the Wallace Training Program, Entitled.',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Color(0xff545454),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                                SizedBox(height: 1.7.h),
                                Text(
                                  '3D Design Illustration Course',
                                  style: const TextStyle(
                                    color: Color(0xff202244),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 0.3.h),
                                Text(
                                  'Issued on November 24, 2022',
                                  style: const TextStyle(
                                    color: Color(0xff545454),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                                SizedBox(height: 1.4.h),
                                Text(
                                  'ID: SK24568086',
                                  style: const TextStyle(
                                    color: Color(0xff472D2D),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'Issued on November 24, 2022',
                            style: const TextStyle(
                              color: Color(0xff545454),
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 25),
            child: CustomButton(label: 'Download Certificate'),
          )
        ],
      ),
    );
  }
}
