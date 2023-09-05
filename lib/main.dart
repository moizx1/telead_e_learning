import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:telead_e_learning/constants/constants.dart';

import 'screen/auth/add_profile_info.dart';
import 'screen/auth/auth_options.dart';
import 'screen/auth/create_new_password.dart';
import 'screen/auth/create_new_pin.dart';
import 'screen/auth/forgot_password.dart';
import 'screen/auth/login.dart';
import 'screen/auth/register.dart';
import 'screen/auth/set_fingerprint.dart';
import 'screen/auth/splash.dart';
import 'screen/auth/start.dart';
import 'screen/auth/verify_password.dart';
import 'screen/dashboard/dashboard.dart';
import 'screen/dashboard/home/all_category.dart';
import 'screen/dashboard/home/course/courses_list.dart';
import 'screen/dashboard/home/course/curriculum.dart';
import 'screen/dashboard/home/course/payment_methods.dart';
import 'screen/dashboard/home/course/popular_courses.dart';
import 'screen/dashboard/home/course/reviews.dart';
import 'screen/dashboard/home/course/single_course_details.dart';
import 'screen/dashboard/home/course/top_mentors.dart';
import 'screen/dashboard/home/course/write_review.dart';
import 'screen/dashboard/home/home.dart';
import 'screen/dashboard/home/notifications.dart';
import 'screen/dashboard/home/search.dart';
import 'screen/dashboard/inbox/chat_screen.dart';
import 'screen/dashboard/inbox/inbox.dart';
import 'screen/dashboard/my_courses/certificate.dart';
import 'screen/dashboard/my_courses/completed_lessons.dart';
import 'screen/dashboard/my_courses/ongoing_lessons.dart';
import 'screen/dashboard/profile/add_new_card.dart';
import 'screen/dashboard/profile/edit_profile.dart';
import 'screen/dashboard/profile/invite_friends.dart';
import 'screen/dashboard/profile/language.dart';
import 'screen/dashboard/profile/notification_settings.dart';
import 'screen/dashboard/profile/payment_options.dart';
import 'screen/dashboard/profile/profile.dart';
import 'screen/dashboard/profile/security.dart';
import 'screen/dashboard/profile/terms_conditions.dart';
import 'screen/dashboard/transactions/receipt.dart';
import 'services/CallListener.dart';
import 'widget/view_image.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await getStorage.initStorage;

  CallListener callListener = CallListener();
  callListener.startCallListener();

  runApp(
    const MyApp(), // Your main widget
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

          navigatorKey: navigatorKey,

          initialRoute: '/',

          getPages: [
            GetPage(name: '/', page: () => SplashScreen()),
            GetPage(name: '/start', page: () => StartScreen()),
            GetPage(name: '/authOptions', page: () => AuthOptions()),
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
            GetPage(name: '/completedLessons', page: () => CompletedLessons()),
            GetPage(name: '/certificate', page: () => Certificate()),
            GetPage(name: '/ongoingLessons', page: () => OngoingLessons()),
            GetPage(name: '/notifications', page: () => Notifications()),
            GetPage(name: '/forgotPassword', page: () => ForgotPassword()),
            GetPage(name: '/verifyPassword', page: () => VerifyPassword()),
            GetPage(name: '/createPassword', page: () => CreateNewPassword()),
            GetPage(name: '/chatScreen', page: () => ChatScreen()),
            GetPage(name: '/viewImage', page: () => ViewImage()),
            GetPage(name: '/inbox', page: () => Inbox()),
            // GetPage(name: '/voiceCallScreen', page: () => VoiceCallScreen()),
            GetPage(name: '/editProfile', page: () => EditProfile()),
            GetPage(name: '/paymentMethods', page: () => PaymentMethods()),
            GetPage(name: '/paymentOptions', page: () => PaymentOptions()),
            GetPage(name: '/addNewCard', page: () => AddNewCard()),
            GetPage(
                name: '/notificationSettings',
                page: () => CustomNotificationSettings()),
            GetPage(name: '/security', page: () => Security()),
            GetPage(name: '/receipt', page: () => Receipt()),
            GetPage(name: '/coursesList', page: () => CoursesList()),
            GetPage(name: '/curriculum', page: () => Curriculum()),
            GetPage(name: '/reviews', page: () => Reviews()),
            GetPage(name: '/writeReview', page: () => WriteReview()),
            GetPage( name:'/profile',page: () => Profile()),
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
