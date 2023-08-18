import 'package:get/get.dart';

class ProfileController extends GetxController {
  onTileTap({route}) => Get.toNamed(route);
  // onNext() => Get.toNamed('/language');
  onBack(result) {
    if (result != null) {
      print(result);
      update();
    }
  }
}
