import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telead_e_learning/screen/auth_options.dart';
import 'package:telead_e_learning/screen/splash.dart';

class StartController extends GetxController {
  int pageIndex = 0;
  final totalDots = 3;
  int currentPosition = 0;
  final PageController pageController = PageController();

  void onSkip() => Get.off(() => const AuthOptions());

  void onNextPressed() {
    currentPosition == 2
        ? Get.off(() => const AuthOptions())
        : currentPosition++;
    pageController.animateToPage(currentPosition,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    update();
  }

  void onPageChanged(int pageIndex) {
    currentPosition = pageIndex;
    update();
  }
}
