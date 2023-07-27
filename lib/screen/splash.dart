import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telead_e_learning/constants/assets.dart';
import 'package:telead_e_learning/controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: const Color(0xff0961F5),
            body: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(AppImages.splashImage1),
                  Image.asset(AppImages.splashImage2),
                  Image.asset(AppImages.splashLogo),
                ],
              ),
            ),
          );
        });
  }
}
