import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:telead_e_learning/screen/add_profile_info.dart';
import 'package:telead_e_learning/screen/dashboard.dart';
import 'package:telead_e_learning/screen/home.dart';
import '../constants/constant.dart';
import '../model/user_model.dart';
import '../services/AuthProvider.dart';
import '../services/FirebaseApi.dart';

class LoginController extends GetxController {
  AuthProvider authProvider = AuthProvider();
  final storage = GetStorage();
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
      UserCredential userCredential = await authProvider.signInWithGoogle();
      await FirebaseApi().initNotifications();
      await authProvider.firestore
          .collection('users')
          .doc(userCredential.user?.email)
          .set({
        'email': userCredential.user?.email,
        'fcmToken': fcmToken
      }).then((_) {
        currentUser = userCredential.user;
      });
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
