import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:telead_e_learning/screen/add_profile_info.dart';
import 'package:telead_e_learning/screen/dashboard.dart';
import 'package:telead_e_learning/screen/home.dart';
import '../model/user_model.dart';
import '../services/AuthProvider.dart';

class LoginController extends GetxController {
  AuthProvider authProvider = AuthProvider();

  String? email, password;
  bool isTextVisible = true;
  bool isChecked = false;

  void toggleVisibility() {
    isTextVisible = !isTextVisible;
    update();
  }

  onSignUpTap() => Get.toNamed('/register');
  onForgotTap() => Get.toNamed('/forgotPassword');

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

  googleSignIn() async {
    try {
      UserCredential user = await authProvider.signInWithGoogle();
      await authProvider.firestore
          .collection('users')
          .doc(user.user?.email)
          .set({'email': user.user?.email});
      Get.toNamed('/inbox');
    } catch (e) {
      print(e);
    }
  }

  onSignIn() async {
    Get.offAll(() => const Dashboard());
    // try {
    //   UserModel userModel = UserModel(email: email, password: password);

    //   // Make the API request
    //   final response = await http.post(
    //     Uri.parse(
    //         'http://rootpointersapp.rootpointers.net/api/Employee/UserLogin'),
    //     headers: {'Content-Type': 'application/json'},
    //     body: json.encode(userModel.toJson()),
    //   );

    //   // Check if the request was successful (status code 200-299)
    //   if (response.statusCode >= 200 && response.statusCode < 300) {
    //     print('SignIn successful!');
    //     Get.offAll(() => const AddProfileInfo());
    //     // You can handle the successful response here
    //   } else {
    //     // Handle the error response
    //     print('SignIn failed with status code: ${response.statusCode}');
    //     print('Response body: ${response.body}');
    //   }
    // } catch (e) {
    //   // Handle any exceptions that occur during the API request
    //   print('Error during signin: $e');
    // }
  }
}
