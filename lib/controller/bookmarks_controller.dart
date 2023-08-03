import 'package:get/get.dart';
class BookmarksController extends GetxController{
    int? currentSelectedCategory = 0, categoryIndex = 0;

  void onCategoryTap(int index) {
    currentSelectedCategory = index;
    update();
  }
}