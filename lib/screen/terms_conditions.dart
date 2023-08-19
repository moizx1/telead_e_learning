import 'package:flutter/material.dart';
import 'package:telead_e_learning/widget/custom_app_bar.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Terms & Conditions'),
    );
  }
}
