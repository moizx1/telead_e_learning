import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class CardDetailsField extends StatelessWidget {
  const CardDetailsField(
      {super.key, this.title, this.content, this.isReadOnly});
  final String? title, content;
  final bool? isReadOnly;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title ?? '',
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Color(0xff202244),
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        CustomTextField(
          hintText: content,
          isReadOnly: isReadOnly,
        ),
      ],
    );
  }
}
