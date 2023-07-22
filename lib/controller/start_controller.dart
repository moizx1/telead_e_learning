import 'package:get/get.dart';
import 'dart:math';
import 'package:telead_e_learning/screen/splash.dart';

class StartController extends GetxController {
  int pageIndex = 0;

  void onNext() {
    pageIndex++;
    update();
  }

  void onSkip() => Get.off(() => SplashScreen());

  final totalDots = 5;
  int currentPosition = 0;

  int _validPosition(int position) {
    if (position >= totalDots) return 0;
    if (position < 0) return totalDots - 1;
    return position;
  }

  void _updatePosition(int position) {
    currentPosition = _validPosition(position);
    update();
  }

  void onNextPressed() {
    currentPosition = currentPosition.floorToDouble().toInt();
    _updatePosition(min(
      ++currentPosition,
      totalDots.toInt(),
    ));
  }
}
