import 'package:get/get.dart';

class WriteReviewController extends GetxController {
  int reviewWordCount = 165;
  int totalWordCount = 165;
  String? review;
  onChanged(value) {
    review = value;
    // wordCount >= 1 ? wordCount-- : null;
    reviewWordCount = totalWordCount - value.toString().length;
    update();
  }
}
