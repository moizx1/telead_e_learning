import 'package:flutter/material.dart';

class StartScreenWidget extends StatelessWidget {
  const StartScreenWidget({super.key, this.heading, this.text});
  final String? heading, text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 150.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            heading ?? 'Loading',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
          ),
          const SizedBox(height: 10),
          Text(
            text ?? '',
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}