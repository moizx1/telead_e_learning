import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:telead_e_learning/model/user_model.dart';

import '../../../screen/dashboard/home/home.dart';

class EditProfileController extends GetxController {
  DateTime selectedDate = DateTime.now();
  TextEditingController dateInput = TextEditingController();
  String get formattedDate => DateFormat('yyyy-MM-dd').format(selectedDate);
  UserModel userModel = UserModel();

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
    userModel.dateOfBirth = dateInput.text;
    update();
  }

  onEmailChanged(value) {
    userModel.email = value;
    update();
  }


  onFirstNameChanged(value) {
    userModel.firstName = value;
    update();
  }

  onLastNameChanged(value) {
    userModel.lastName = value;
    update();
  }

  // onDobChanged(value) {
  //   userModel.dateOfBirth = value;
  //   update();
  // }

  onPhoneChanged(value) {
    userModel.phone = value;
    update();
  }

  onGenderChanged(value) {
    userModel.gender = value;
    update();
  }

  onSave() async {
    try {
      print(json.encode(userModel.toJson()));
      // Make the API request
      final response = await http.post(
        Uri.parse(
            'http://rootpointersapp.rootpointers.net/api/Employee/AddEmployeeInfo'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(userModel.toJson()),
      );

      // Check if the request was successful (status code 200-299)
      if (response.statusCode >= 200 && response.statusCode < 300) {
        print('SignIn successful!');
        Get.offAll(() => const Home());
        // You can handle the successful response here
      } else {
        // Handle the error response
        print('SignIn failed with status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      // Handle any exceptions that occur during the API request
      print('Error during signin: $e');
    }
  }
}
