import 'package:get/get.dart';

class WriteReviewController extends GetxController {
  int wordCount = 250;
  String? review;
  onChanged(value) {
    review = value;
    wordCount--;
    update();
  }
}
