import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:telead_e_learning/screen/add_profile_info.dart';
import 'package:telead_e_learning/screen/all_category.dart';
import 'package:telead_e_learning/screen/auth_options.dart';
import 'package:telead_e_learning/screen/bookmarks.dart';
import 'package:telead_e_learning/screen/courses_list.dart';
import 'package:telead_e_learning/screen/create_new_password.dart';
import 'package:telead_e_learning/screen/create_new_pin.dart';
import 'package:telead_e_learning/screen/dashboard.dart';
import 'package:telead_e_learning/screen/forgot_password.dart';
import 'package:telead_e_learning/screen/home.dart';
import 'package:telead_e_learning/screen/login.dart';
import 'package:telead_e_learning/screen/mentor_details.dart';
import 'package:telead_e_learning/screen/my_courses.dart';
import 'package:telead_e_learning/screen/notifications.dart';
import 'package:telead_e_learning/screen/ongoing_lessons.dart';
import 'package:telead_e_learning/screen/payment_methods.dart';
import 'package:telead_e_learning/screen/popular_courses.dart';
import 'package:telead_e_learning/screen/register.dart';
import 'package:telead_e_learning/screen/reviews.dart';
import 'package:telead_e_learning/screen/search.dart';
import 'package:telead_e_learning/screen/set_fingerprint.dart';
import 'package:telead_e_learning/screen/single_course_details.dart';
import 'package:telead_e_learning/screen/splash.dart';
import 'package:telead_e_learning/screen/start.dart';
import 'package:telead_e_learning/screen/top_mentors.dart';
import 'package:telead_e_learning/screen/verify_password.dart';
import 'package:telead_e_learning/screen/write_review.dart';
import 'package:telead_e_learning/widget/reset_password_card.dart';

void main() {
  runApp(const GetMaterialApp(
    home: MyApp(), // Your main widget
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Telead E-learning App',
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: const Color(0xff0961F5)),
            useMaterial3: true,
            scaffoldBackgroundColor: const Color(0xffF5F9FF),
            appBarTheme: AppBarTheme(
              toolbarHeight: Get.statusBarHeight,
              titleSpacing: 0,
              color: const Color(0xffF5F9FF),
              titleTextStyle: const TextStyle(
                color: Color(0xff202244),
                fontSize: 21,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          home: WriteReview(),
        );
      },
    );
  }
}
