import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomRadioTile extends StatelessWidget {
  const CustomRadioTile(
      {super.key, this.title, this.value, this.groupValue, this.onchanged});
  final String? title, value, groupValue;
  final Function(String?)? onchanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            textAlign: TextAlign.end,
            '$title',
            style: TextStyle(
              color: Color(0xff202244),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Radio<String?>(
              value: value, groupValue: groupValue, onChanged: onchanged),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
