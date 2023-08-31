import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:telead_e_learning/screen/profile.dart';
import '../constants/constants.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    // Future.delayed(const Duration(seconds: 1), () async {});
    try {
      final permissionStatus = await Permission.storage.status;
      // if (permissionStatus.isDenied) {
      // Here just ask for the permission for the first time
      // await Permission.storage.request();

      // I noticed that sometimes popup won't show after user press deny
      // so I do the check once again but now go straight to appSettings
      // if (permissionStatus.isDenied) {
      //     await openAppSettings();
      //   }
      // }
      //  else if (permissionStatus.isPermanentlyDenied) {
      //   // Here open app settings for user to manually enable permission in case
      //   // where permission was permanently denied
      //   await openAppSettings();
      // }
      // else {
      // Do stuff that require permission here
      userData = await readUserData();
      if (userData != null) {
        Get.offNamed('/dashboard');
      } else {
        Get.offNamed('/start');
      }
      // }
    } catch (e) {
      print(e);
    }
    super.onInit();
  }
}
