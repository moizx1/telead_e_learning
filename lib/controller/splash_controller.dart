import 'package:get/get.dart';
import '../constants/constant.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    // Future.delayed(const Duration(seconds: 1), () async {});
    try {
      userData = await readUserData();
      if (userData != null) {
        Get.offNamed('/dashboard');
      } else {
        Get.offNamed('/start');
      }
    } catch (e) {
      print(e);
    }
    super.onInit();
  }
}
