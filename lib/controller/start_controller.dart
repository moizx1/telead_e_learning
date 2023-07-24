import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telead_e_learning/screen/splash.dart';

class StartController extends GetxController {
  int pageIndex = 0;
  final totalDots = 3;
  int currentPosition = 0;
  final PageController pageController = PageController();

  void onSkip() => Get.off(() => const SplashScreen());

  // int _validPosition(int position) {
  //   if (position >= totalDots) return 0;
  //   if (position < 0) return totalDots - 1;
  //   return position;
  // }

  // void _updatePosition(int position) {
  //   currentPosition = _validPosition(position);
  //   update();
  // }

  void onNextPressed() {
    // currentPosition = currentPosition.floorToDouble().toInt();
    currentPosition++;
    pageController.animateToPage(currentPosition,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    update();
  }

  void onPageChanged(int pageIndex) {
    currentPosition = pageIndex;
    update();
  }
}
