import 'package:flutter/material.dart';

class CustomListviewTile extends StatelessWidget {
  const CustomListviewTile(
      {super.key,
      required this.title,
      required this.description,
      this.leading,
      this.trailing,
      this.onTap});
  final String title;
  final VoidCallback? onTap;
  final Widget? leading, trailing;
  final Widget description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: const Color(0xffE8F1FF),
                        ),
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      child: leading,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: Color(0xff202244),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        description,
                      ],
                    ),
                  ],
                ),
                trailing ?? const SizedBox(),
              ],
            ),
          ),
        ),
        const Divider(color: Color(0xffE8F1FF)),
      ],
    );
  }
}
