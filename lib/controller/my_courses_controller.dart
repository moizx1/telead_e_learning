import 'package:get/get.dart';

class MyCoursesController extends GetxController {
  int? currentSelectedCategory = 0;
  void onCompletedTap() {
    currentSelectedCategory = 0;
    update();
  }

  void onOngoingTap() {
    currentSelectedCategory = 1;
    update();
  }

  onCompletedCourseTap()=>Get.toNamed('/completedLessons');
  onOngoingCourseTap()=>Get.toNamed('/ongoingLessons');
}
