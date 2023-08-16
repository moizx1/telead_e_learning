import 'package:get/get.dart';

class ProfileController extends GetxController {
  onNext() => Get.toNamed('/language');
  onBack(result) {
    if (result != null) {
      print(result);
      update();
    }
  }
}
