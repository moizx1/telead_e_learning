import 'package:get/get.dart';

class PaymentMethodController extends GetxController {
  String? paymentMethod;

  selectPayment(value) {
    paymentMethod = value;
    update();
  }
}
