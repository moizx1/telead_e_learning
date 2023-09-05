import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telead_e_learning/widgets/custom_app_bar.dart';
import 'package:telead_e_learning/widgets/custom_button.dart';
import 'package:telead_e_learning/widgets/custom_radio_tile.dart';
import 'package:telead_e_learning/widgets/mentor_course_card.dart';

import '../../../../controllers/dashboard/home/course/payment_method_controller.dart';
import '../../../../widgets/custom_alert.dart';


class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentMethodController>(
        init: PaymentMethodController(),
        builder: (controller) {
          return Scaffold(
              appBar: const CustomAppBar(title: 'Payment Methods'),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        MentorCourseCard(),
                        const SizedBox(height: 15),
                        Text(
                          'Select the Payment Methods you Want to Use',
                          style: TextStyle(
                            color: Color(0xff545454),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15),
                        CustomRadioTile(
                          title: 'Paypal',
                          value: 'paypal',
                          groupValue: controller.paymentMethod,
                          onchanged: controller.selectPayment,
                        ),
                        const SizedBox(height: 10),
                        CustomRadioTile(
                          title: 'Google Pay',
                          value: 'googlePay',
                          groupValue: controller.paymentMethod,
                          onchanged: controller.selectPayment,
                        ),
                        const SizedBox(height: 10),
                        CustomRadioTile(
                          title: 'Apple Pay',
                          value: 'applePAy',
                          groupValue: controller.paymentMethod,
                          onchanged: controller.selectPayment,
                        ),
                        const SizedBox(height: 10),
                        CustomRadioTile(
                          title: '**** **** **76 3054',
                          value: 'iban',
                          groupValue: controller.paymentMethod,
                          onchanged: controller.selectPayment,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          height: 62,
                          width: 62,
                          decoration: const BoxDecoration(
                            color: Color(0xff0961F5),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.add_rounded,
                            color: Colors.white,
                            size: 46,
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomButton(
                          label: 'Enroll Course - \$55',
                          onPress: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const CustomAlert.paymentSuccessfull();
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ],
                ),
              ));
        });
  }
}
