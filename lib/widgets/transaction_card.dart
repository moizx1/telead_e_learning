import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          height: 92,
          width: 92,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Build Personal Branding',
              style: TextStyle(
                color: Color(0xff202244),
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 2.5),
            Text(
              'Web Designer',
              style: TextStyle(
                color: Color(0xff545454),
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 12.5),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2.5),
              color: Color(0xff167F71),
              child: Text(
                'Paid',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 2)
          ],
        ),
      ],
    );
  }
}
