import 'package:flutter/material.dart';
import 'package:telead_e_learning/widget/custom_app_bar.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'David Beckham',
        trailing: Padding(
          padding: const EdgeInsets.only(right: 14),
          child: Icon(Icons.local_phone_outlined, size: 24),
        ),
        showSearchIcon: true,
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
