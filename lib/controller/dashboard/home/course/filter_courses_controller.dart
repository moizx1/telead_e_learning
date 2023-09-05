import 'package:get/get.dart';
import 'package:telead_e_learning/dummy_data.dart';
import 'package:telead_e_learning/model/filter_course_model.dart';

class FilterCoursesController extends GetxController {
  List<FilterCoursesModel> filteredList = DummyData.filterCoursesList;
  onChange(value, index, nextIndex) {
    filteredList[index].elements?[nextIndex].isChecked = value;
    update();
  }
}
