import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:telead_e_learning/model/filter_course_model.dart';
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
import 'package:telead_e_learning/screen/notification_settings.dart';
import 'package:telead_e_learning/screen/notifications.dart';
import 'package:telead_e_learning/screen/ongoing_lessons.dart';
import 'package:telead_e_learning/screen/payment_methods.dart';
import 'package:telead_e_learning/screen/payment_options.dart';
import 'package:telead_e_learning/screen/popular_courses.dart';
import 'package:telead_e_learning/screen/register.dart';
import 'package:telead_e_learning/screen/reviews.dart';
import 'package:telead_e_learning/screen/search.dart';
import 'package:telead_e_learning/screen/security.dart';
import 'package:telead_e_learning/screen/set_fingerprint.dart';
import 'package:telead_e_learning/screen/single_course_details.dart';
import 'package:telead_e_learning/screen/splash.dart';
import 'package:telead_e_learning/screen/start.dart';
import 'package:telead_e_learning/screen/terms_conditions.dart';
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
            GetPage(name: '/', page: () => AuthOptions()),
            GetPage(name: '/login', page: () => Login()),
            GetPage(name: '/regiter', page: () => Register()),
            GetPage(name: '/addProfileInfo', page: () => AddProfileInfo()),
            GetPage(name: '/createNewPin', page: () => CreateNewPin()),
            GetPage(name: '/setFingerprint', page: () => SetFingerprint()),
            GetPage(name: '/dashboard', page: () => Dashboard()),
            GetPage(name: '/home', page: () => Home()),
            GetPage(name: '/search', page: () => Search()),
            GetPage(name: '/categories', page: () => AllCategory()),
            GetPage(name: '/popularCourses', page: () => PopularCourses()),
            GetPage(
                name: '/singleCourseDetails',
                page: () => SingleCourseDetails()),
            GetPage(name: '/topMentors', page: () => TopMentors()),
            GetPage(name: '/topMentors', page: () => TopMentors()),
            GetPage(name: '/completedLessons', page: () => CompletedLessons()),
            GetPage(name: '/certificate', page: () => Certificate()),
            GetPage(name: '/ongoingLessons', page: () => OngoingLessons()),
            GetPage(name: '/notifications', page: () => Notifications()),
            GetPage(name: '/forgotPassword', page: () => ForgotPassword()),
            GetPage(name: '/verifyPassword', page: () => VerifyPassword()),
            GetPage(name: '/createPassword', page: () => CreateNewPassword()),
            GetPage(name: '/chatScreen', page: () => ChatScreen()),
            GetPage(name: '/voiceCallScreen', page: () => VoiceCallScreen()),
            GetPage(name: '/editProfile', page: () => EditProfile()),
            GetPage(name: '/paymentMethods', page: () => PaymentMethods()),
            GetPage(name: '/paymentOptions', page: () => PaymentOptions()),
            GetPage(name: '/addNewCard', page: () => AddNewCard()),
            GetPage(
                name: '/notificationSettings',
                page: () => NotificationSettings()),
            GetPage(name: '/security', page: () => Security()),
            GetPage(name: '/receipt', page: () => Receipt()),
            GetPage(name: '/coursesList', page: () => CoursesList()),
            GetPage(name: '/curriculum', page: () => Curriculum()),
            GetPage(name: '/reviews', page: () => Reviews()),
            GetPage(name: '/writeReview', page: () => WriteReview()),
            //GetPage( name:'/profile',page: () => Profile()),
            GetPage(name: '/language', page: () => Language()),
            GetPage(name: '/dashboard', page: () => Dashboard()),
            GetPage(name: '/terms', page: () => TermsConditions()),
            GetPage(name: '/inviteFriends', page: () => InviteFriends()),
          ],

          // home: const Profile(),
        );
      },
    );
  }
}
