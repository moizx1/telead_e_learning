import 'package:get/get.dart';

import '../dummy_data.dart';

class LanguageController extends GetxController {
  List<Map<String, Object>> list = DummyData.languages;
  onChange(value, index) {
    if (list[index]['isChecked'] == false) {
      for (var obj in list) {
        if (obj['isChecked'] == true) {
          obj['isChecked'] = false;
          break;
        }
      }
      list[index]['isChecked'] = value;
    }
    update();
  }
}
