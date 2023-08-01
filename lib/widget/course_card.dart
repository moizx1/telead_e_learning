import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  const CourseCard(
      {super.key,
      this.category,
      this.name,
      this.price,
      this.rating,
      this.courseCode});
  final String? category, name;
  final double? price, rating, courseCode;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(height: 240),
        child: Column(
          children: [
            Container(
              height: 134,
              width: 284,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16, top: 5, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$category',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Color(0xffFF6B00)),
                      ),
                      const Icon(
                        Icons.bookmark_border_rounded,
                        size: 26,
                      )
                    ],
                  ),
                  Text(
                    '$name',
                    style: const TextStyle(
                        color: Color(0xff202244),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  const SizedBox(height: 7.5),
                  Row(children: [
                    Text(
                      '\$ ${price?.toInt()}',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff0961F5),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text('|'),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.star_rounded,
                      color: Color(0xffFAC025),
                      size: 18,
                    ),
                    Text(
                      '$rating',
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff202244),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text('|'),
                    const SizedBox(width: 10),
                    Text(
                      '${courseCode?.toInt()} Std',
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff202244),
                      ),
                    ),
                  ])
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
