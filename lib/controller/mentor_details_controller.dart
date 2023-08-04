import 'package:get/get.dart';

class MentorDetailsController extends GetxController {
  int? selectedIndex = 0;
  void onCoursesTap() {
    selectedIndex = 0;
    update();
  }

  void onRatingTap() {
    selectedIndex = 1;
    update();
  }
}
