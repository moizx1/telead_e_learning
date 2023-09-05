import 'package:flutter/material.dart';
import 'package:telead_e_learning/widgets/card_details_field.dart';
import 'package:telead_e_learning/widgets/atm_card_widget.dart';
import 'package:telead_e_learning/widgets/custom_app_bar.dart';
import 'package:telead_e_learning/widgets/custom_button.dart';
import 'package:telead_e_learning/widgets/custom_text_field.dart';

class AddNewCard extends StatelessWidget {
  const AddNewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Add New Card'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                children: [
                  AtmCardWidget(
                    cardNumber: '1234  5678  8765  0876',
                    name: 'Timmy C. Hernandez',
                    expiryMonth: 12,
                    expiryYear: 28,
                  ),
                  const SizedBox(height: 20),
                  CardDetailsField(
                    title: 'Card Name*',
                    content: 'Belinda C. Cullen',
                    isReadOnly: true,
                  ),
                  const SizedBox(height: 15),
                  CardDetailsField(
                    title: 'Card Number*',
                    content: '****  **65  8765  3456',
                    isReadOnly: true,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: CardDetailsField(
                          title: 'Expiry Date*',
                          content: '12/28',
                          isReadOnly: true,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: CardDetailsField(
                            title: 'CVV*', content: '***', isReadOnly: true),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(label: 'Add New Card'),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
