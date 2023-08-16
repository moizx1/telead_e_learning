class FilterCoursesModel {
  FilterCoursesModel({this.title, this.elements});
  String? title;
  List<Categories>? elements;
}

class Categories {
  final String name;
  bool isChecked = false;

  Categories(this.name, this.isChecked);
}
