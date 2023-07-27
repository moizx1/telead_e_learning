import 'package:flutter/material.dart';

class ResetPasswordCard extends StatelessWidget {
  const ResetPasswordCard({super.key, this.icon, this.title, this.content});
  final IconData? icon;
  final String? title, content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xffE8F1FF),
              border: Border.all(
                color: const Color(0xff167F71),
                width: 2,
              ),
            ),
            child:  Icon(
              icon,
              color: const Color(0xff167F71),
              size: 20,
            ),
          ),
          const SizedBox(width: 14),
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title??'',
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xff505050),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                content ?? '',
                style:const  TextStyle(
                  fontSize: 14,
                  color: Color(0xff202244),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
