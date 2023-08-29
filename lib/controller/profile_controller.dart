import 'package:get/get.dart';

class ProfileController extends GetxController {
  onTileTap({route}) => Get.toNamed(route);
  onBack(result) {
    if (result != null) {
      update();
    }
  }
}
