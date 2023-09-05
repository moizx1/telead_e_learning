import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telead_e_learning/widgets/custom_app_bar.dart';
import 'package:telead_e_learning/widgets/custom_button.dart';

import '../../../controllers/dashboard/profile/payment_options_controller.dart';

class PaymentOptions extends StatelessWidget {
  const PaymentOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentOptionsController>(
        init: PaymentOptionsController(),
        builder: (controller) {
          return Scaffold(
            appBar: CustomAppBar(title: 'Payment Option'),
            body: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 28),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '**** ****  **76  3054',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Color(0xff202244),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                'Connected',
                                style: const TextStyle(
                                  color: Color(0xff167F71),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  CustomButton(
                    label: 'Add New Card',
                    onPress: controller.addNewCard,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
