import 'package:get/get.dart';

class SingleCourseController extends GetxController {
  int? selectedIndex = 0;
  void onAboutTap() {
    selectedIndex = 0;
    update();
  }

  void onCurriculumTap() {
    selectedIndex = 1;
    update();
  }
}
