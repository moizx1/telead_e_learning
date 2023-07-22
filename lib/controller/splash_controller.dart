import 'package:get/get.dart';
import 'package:telead_e_learning/screen/start.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(Duration(seconds: 2), () {
      Get.to(() => StartScreen());
    });
    super.onInit();
  }
}
