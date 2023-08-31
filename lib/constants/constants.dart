import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';

import '../model/user_model.dart';
import 'app_keys.dart';

final getStorage = GetStorage();
String? fcmToken;
User? currentUser;
UserModel? userData;

Future readUserData() async {
  final localData = await getStorage.read(AppKeys.userData);
  if (localData != null) {
    return userData = UserModel.fromJson(localData as Map<String, dynamic>);
  } else {
    return null;
  }
}