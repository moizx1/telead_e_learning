import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telead_e_learning/widget/custom_app_bar.dart';
import 'package:telead_e_learning/widget/custom_radio_tile.dart';
import 'package:telead_e_learning/widget/mentor_course_card.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (controller) {
        return Scaffold(
            appBar: const CustomAppBar(title: 'Payment Methods'),
            body: Column(
              children: [
                MentorCourseCard(),
                Text(
                  'Select the Payment Methods you Want to Use',
                  style: TextStyle(
                    color: Color(0xff545454),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CustomRadioTile(title: 'Paypal'),
                CustomRadioTile(title: 'Google Pay'),
                CustomRadioTile(title: 'Apple Pay'),
                CustomRadioTile(title: '**** **** **76 3054'),
              ],
            ));
      }
    );
  }
}
