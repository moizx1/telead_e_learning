import 'package:get/get.dart';
import 'package:telead_e_learning/model/language_model.dart';
import '../dummy_data.dart';

class LanguageController extends GetxController {
  List<LanguageModel> list = DummyData.languages;

  onBackPressed() {
    Get.back(result: list.firstWhere((element) => element.isChecked == true));
  }

  onChange(value, index) {
    if (list[index].isChecked == false) {
      for (var obj in list) {
        if (obj.isChecked == true) {
          obj.isChecked = false;
          break;
        }
      }
      list[index].isChecked = value;
    }
    update();
  }
}
