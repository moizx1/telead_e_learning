import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:telead_e_learning/constants/constants.dart';

import 'screens/auth/add_profile_info.dart';
import 'screens/auth/auth_options.dart';
import 'screens/auth/create_new_password.dart';
import 'screens/auth/create_new_pin.dart';
import 'screens/auth/forgot_password.dart';
import 'screens/auth/login.dart';
import 'screens/auth/register.dart';
import 'screens/auth/set_fingerprint.dart';
import 'screens/auth/splash.dart';
import 'screens/auth/start.dart';
import 'screens/auth/verify_password.dart';
import 'screens/dashboard/dashboard.dart';
import 'screens/dashboard/home/all_category.dart';
import 'screens/dashboard/home/course/courses_list.dart';
import 'screens/dashboard/home/course/curriculum.dart';
import 'screens/dashboard/home/course/payment_methods.dart';
import 'screens/dashboard/home/course/popular_courses.dart';
import 'screens/dashboard/home/course/reviews.dart';
import 'screens/dashboard/home/course/single_course_details.dart';
import 'screens/dashboard/home/course/top_mentors.dart';
import 'screens/dashboard/home/course/write_review.dart';
import 'screens/dashboard/home/home.dart';
import 'screens/dashboard/home/notifications.dart';
import 'screens/dashboard/home/search.dart';
import 'screens/dashboard/inbox/chat_screen.dart';
import 'screens/dashboard/inbox/inbox.dart';
import 'screens/dashboard/my_courses/certificate.dart';
import 'screens/dashboard/my_courses/completed_lessons.dart';
import 'screens/dashboard/my_courses/ongoing_lessons.dart';
import 'screens/dashboard/profile/add_new_card.dart';
import 'screens/dashboard/profile/edit_profile.dart';
import 'screens/dashboard/profile/invite_friends.dart';
import 'screens/dashboard/profile/language.dart';
import 'screens/dashboard/profile/notification_settings.dart';
import 'screens/dashboard/profile/payment_options.dart';
import 'screens/dashboard/profile/profile.dart';
import 'screens/dashboard/profile/security.dart';
import 'screens/dashboard/profile/terms_conditions.dart';
import 'screens/dashboard/transactions/receipt.dart';
import 'services/CallListener.dart';
import 'widgets/view_image.dart';

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
