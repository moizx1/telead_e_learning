import 'package:get/get.dart';

class ReceiptController extends GetxController {
  bool isMenuOpened = false;

  onMenuOpen() {
    isMenuOpened = true;
    update();
  }

  onMenuClose() {
    isMenuOpened = false;
    update();
  }
}
