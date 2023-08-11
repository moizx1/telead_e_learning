import 'package:flutter/material.dart';
import 'package:telead_e_learning/widget/custom_app_bar.dart';

import '../widget/transaction_card.dart';

class Transactions extends StatelessWidget {
  const Transactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Transactions', showSearchIcon: true),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 24),
        itemCount: 5,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Column(
            children: [
              TransactionCard(),
              const SizedBox(height: 20),
              const Divider(color: Color(0xffE8F1FF)),
              const SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}