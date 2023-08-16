import 'package:flutter/material.dart';
import 'package:telead_e_learning/model/language_model.dart';
import 'package:telead_e_learning/model/notification_model.dart';

import 'model/filter_course_model.dart';

class DummyData {
  static List<LanguageModel> languages = [
    LanguageModel(language: 'English (US)', isChecked: true),
    LanguageModel(language: 'Arabic', isChecked: false),
    LanguageModel(language: 'Hindi', isChecked: false),
    LanguageModel(language: 'Bengali', isChecked: false),
    LanguageModel(language: 'Italian', isChecked: false),
    LanguageModel(language: 'Korean', isChecked: false),
    LanguageModel(language: 'Francais', isChecked: false),
    LanguageModel(language: 'Russian', isChecked: false),
    LanguageModel(language: 'Polish', isChecked: false),
  ];

  static List<FilterCoursesModel> filterCoursesList = [
    FilterCoursesModel(title: 'SubCategories:', elements: [
      Categories('3D design', false),
      Categories('Web Development', false),
      Categories('3D Animation', false),
      Categories('Graphic Design', false),
      Categories('SEO & Marketing', false),
    ]),
    FilterCoursesModel(title: 'Levels:', elements: [
      Categories('All Levels', false),
      Categories('Beginners', false),
      Categories('Intermediate', false),
      Categories('Expert', false),
    ]),
    FilterCoursesModel(title: 'Price:', elements: [
      Categories('Paid', false),
      Categories('Free', false),
    ]),
    FilterCoursesModel(title: 'Features:', elements: [
      Categories('All Caption', false),
      Categories('Quizzes', false),
      Categories('Coding Exercise', false),
      Categories('Practice Tests', false),
    ]),
  ];

  static List<NotificationModel> dummyData = [
    NotificationModel(
      icon: Icons.discount,
      title: 'New Category Course.!',
      description: 'New the 3D Design Course is Availa…',
      date: '02/08/2023',
    ),
    NotificationModel(
      icon: Icons.discount,
      title: 'Today\'s Special Offers',
      description: 'You Have made a Coure Payment.',
      date: '01/08/2023',
    ),
    NotificationModel(
      icon: Icons.discount,
      title: 'Today\'s Special',
      description: 'You Have made a Coure Payment......',
      date: '25/07/2023',
    ),
    NotificationModel(
      icon: Icons.discount,
      title: 'New Category Course.!',
      description: 'New the 3D Design Course is Availa…',
      date: '12/07/2023',
    ),
  ];
}
