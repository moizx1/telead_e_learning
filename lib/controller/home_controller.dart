import 'package:get/get.dart';

class HomeController extends GetxController {
  int? currentSelectedCategory = 0;
  // int? categoryIndex;
  onCategoryTap(index) {
    currentSelectedCategory = index;
    update();
  }
}
