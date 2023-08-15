import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Language extends StatelessWidget {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'All Languages',
          style: TextStyle(
            color: Color(0xff202244),
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Text('English (US)'),
                Radio(value: value, groupValue: groupValue, onChanged: onChanged)
              ],
            );
          },
        )
      ],
    );
  }
}
