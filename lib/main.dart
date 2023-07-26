import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:telead_e_learning/screen/add_profile_info.dart';
import 'package:telead_e_learning/screen/auth_options.dart';
import 'package:telead_e_learning/screen/login.dart';
import 'package:telead_e_learning/screen/register.dart';
import 'package:telead_e_learning/screen/splash.dart';
import 'package:telead_e_learning/screen/start.dart';

void main() {
  runApp(const MyApp());
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
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
          home: const AddProfileInfo(),
        );
      },
    );
  }
}
