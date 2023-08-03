import 'package:flutter/material.dart';

class MentorCard extends StatelessWidget {
  const MentorCard(
      {super.key,
      this.name,
      this.category,
      this.imageUrl,
      this.showMessageIcon = false});
  final String? name, category, imageUrl;
  final bool? showMessageIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 66,
                  width: 66,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name ?? '',
                      style: const TextStyle(
                        color: Color(0xff202244),
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      category ?? '',
                      style: const TextStyle(
                        color: Color(0xff545454),
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ],
            ),
            if (showMessageIcon == true) Icon(Icons.message_outlined),
          ],
        ),
        const SizedBox(height: 15),
        const Divider(color: Color.fromARGB(255, 201, 213, 234), thickness: 1),
        const SizedBox(height: 15),
      ],
    );
  }
}
