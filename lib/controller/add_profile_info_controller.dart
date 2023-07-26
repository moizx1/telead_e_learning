import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddProfileInfoController extends GetxController {
  DateTime selectedDate = DateTime.now();
  TextEditingController dateInput = TextEditingController();
  String get formattedDate => DateFormat('yyyy-MM-dd').format(selectedDate);

  void selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      selectedDate = pickedDate;
    }
    dateInput.text = DateFormat('yyyy-MM-dd').format(selectedDate);
    update();
  }
}
