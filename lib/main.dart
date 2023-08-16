import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:telead_e_learning/screen/add_new_card.dart';
import 'package:telead_e_learning/screen/add_profile_info.dart';
import 'package:telead_e_learning/screen/all_category.dart';
import 'package:telead_e_learning/screen/auth_options.dart';
import 'package:telead_e_learning/screen/bookmarks.dart';
import 'package:telead_e_learning/screen/chat_screen.dart';
import 'package:telead_e_learning/screen/completed_lessons.dart';
import 'package:telead_e_learning/screen/courses_list.dart';
import 'package:telead_e_learning/screen/create_new_password.dart';
import 'package:telead_e_learning/screen/create_new_pin.dart';
import 'package:telead_e_learning/screen/curriculum.dart';
import 'package:telead_e_learning/screen/dashboard.dart';
import 'package:telead_e_learning/screen/edit_profile.dart';
import 'package:telead_e_learning/screen/filter_courses.dart';
import 'package:telead_e_learning/screen/forgot_password.dart';
import 'package:telead_e_learning/screen/home.dart';
import 'package:telead_e_learning/screen/inbox.dart';
import 'package:telead_e_learning/screen/invite_friends.dart';
import 'package:telead_e_learning/screen/language.dart';
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
import 'package:telead_e_learning/screen/security.dart';
import 'package:telead_e_learning/screen/set_fingerprint.dart';
import 'package:telead_e_learning/screen/single_course_details.dart';
import 'package:telead_e_learning/screen/splash.dart';
import 'package:telead_e_learning/screen/start.dart';
import 'package:telead_e_learning/screen/top_mentors.dart';
import 'package:telead_e_learning/screen/transactions.dart';
import 'package:telead_e_learning/screen/verify_password.dart';
import 'package:telead_e_learning/screen/voice_call_screen.dart';
import 'package:telead_e_learning/screen/write_review.dart';
import 'package:telead_e_learning/widget/reset_password_card.dart';
import 'package:telead_e_learning/widget/video_player_screen.dart';

import 'controller/completed_lessons_controller.dart';
import 'screen/certificate.dart';
import 'screen/profile.dart';
import 'screen/receipt.dart';

void main() {
  runApp(
    MyApp(), // Your main widget
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
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

          initialRoute: '/',

          getPages: [
            GetPage(name: '/', page: () => Certificate()),
            GetPage(name: '/login', page: () => Login()),
            GetPage(name: '/regiter', page: () => Register()),
            GetPage(name: '/dashboard', page: () => Dashboard()),
            //GetPage( name:'/profile',page: () => Profile()),
            // GetPage(name: '/language', page: () => Language()),
            //GetPage( name:'/dashboard',page:()=>Dashboard()),
          ],

          // home: const Profile(),
        );
      },
    );
  }
}
