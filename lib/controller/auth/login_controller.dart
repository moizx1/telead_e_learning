import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../constants/app_keys.dart';
import '../../constants/constants.dart';
import '../../model/user_model.dart';
import '../../screen/dashboard/dashboard.dart';
import '../../services/AuthProvider.dart';
import '../../services/FirebaseNotification.dart';

class LoginController extends GetxController {
  AuthProvider authProvider = AuthProvider();
  final storage = GetStorage();
  String? email, password;
  bool isTextVisible = true, isChecked = false, isLoading = false;

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
      Get.dialog(
        const Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );
      UserCredential userCredential = await authProvider.signInWithGoogle();
      await FirebaseNotification().initNotifications();
      await authProvider.firestore
          .collection('users')
          .doc(userCredential.user?.email)
          .set({'email': userCredential.user?.email, 'fcmToken': fcmToken});
      currentUser = userCredential.user;
      DocumentSnapshot userDoc = await authProvider.firestore
          .collection('users')
          .doc(currentUser?.email)
          .get();
      UserModel signInModel = UserModel(
        email: userDoc['email'],
        fcmToken: userDoc['fcmToken'],
      );
      getStorage.write(AppKeys.userData, signInModel.toJson());
      userData = signInModel;
      Get.offAllNamed('/dashboard');
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
