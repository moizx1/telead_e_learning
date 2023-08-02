import 'package:get/get.dart';

class DashboardController extends GetxController {
  int currentIndex = 0;

  updateIndex(int index) {
    currentIndex = index;
    update();
  }
}
