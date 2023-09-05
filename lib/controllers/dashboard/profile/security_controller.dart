import 'package:get/get.dart';

class SecurityController extends GetxController {
  SwitchValue rememberMe=SwitchValue(value:false);
  SwitchValue biometric=SwitchValue(value:false);
  SwitchValue faceId=SwitchValue(value:false);
  

  handleToggle(SwitchValue switchValue, bool newValue) {
    switchValue.value = newValue;
    update();
  }
}
class SwitchValue {
  bool? value;
  SwitchValue({this.value});
}
