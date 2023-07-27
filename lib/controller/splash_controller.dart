import 'package:get/get.dart';
import 'package:telead_e_learning/screen/start.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 1), () {
      Get.off(() => const StartScreen());
    });
    super.onInit();
  }
}
