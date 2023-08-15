import 'package:get/get.dart';

import '../dummy_data.dart';

class LanguageController extends GetxController {
   String groupValue = 'language';
   List list = DummyData.languages;
  onRadioChange(value) {
    groupValue = value;
    update();
  }
}
