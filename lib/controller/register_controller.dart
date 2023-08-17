import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:telead_e_learning/model/user_model.dart';

import '../screen/login.dart';

class RegisterController extends GetxController {
  String? email, password;
  bool isTextVisible = true;
  bool isChecked = false;

  void toggleVisibility() {
    isTextVisible = !isTextVisible;
    update();
  }

  void toggleCheckBox() {
    isChecked = !isChecked;
    update();
  }

  onEmailChanged(value) {
    email = value;
    update();
  }

  onPasswordChanged(value) {
    password = value;
    update();
  }

  onSignUp() async {
    Get.toNamed('/addProfileInfo');
    // try {
    //   UserModel userModel = UserModel(email: email, password: password);

    //   // Make the API request
    //   final response = await http.post(
    //     Uri.parse(
    //         'http://rootpointersapp.rootpointers.net/api/Employee/UserSignUp'),
    //     headers: {'Content-Type': 'application/json'},
    //     body: json.encode(userModel.toJson()),
    //   );

    //   // Check if the request was successful (status code 200-299)
    //   if (response.statusCode >= 200 && response.statusCode < 300) {
    //     print('Signup successful!');
    //     Get.off(() => Login());
    //     // You can handle the successful response here
    //   } else {
    //     // Handle the error response
    //     print('Signup failed with status code: ${response.statusCode}');
    //     print('Response body: ${response.body}');
    //   }
    // } catch (e) {
    //   // Handle any exceptions that occur during the API request
    //   print('Error during signup: $e');
    // }
  }
}
