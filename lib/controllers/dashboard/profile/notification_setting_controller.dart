import 'package:get/get.dart';

class NotificationSettingController extends GetxController {
  SwitchValue specialOffers=SwitchValue(value:false);
  SwitchValue sound=SwitchValue(value:false);
  SwitchValue vibrate=SwitchValue(value:false);
  SwitchValue generalNotification=SwitchValue(value:false);
  SwitchValue promo=SwitchValue(value:false);
  SwitchValue paymentOptions=SwitchValue(value:false);
  SwitchValue appUpdate=SwitchValue(value:false);
  SwitchValue newService=SwitchValue(value:false);
  SwitchValue newTips=SwitchValue(value:false);
  

  handleToggle(SwitchValue switchValue, bool newValue) {
    switchValue.value = newValue;
    update();
  }
}

class SwitchValue {
  bool? value;
  SwitchValue({this.value});
}
