import 'package:flutter/material.dart';

class CourseCards extends StatelessWidget {
  final Widget _child;

  CourseCards({Key? key})
      : _child = Container(),
        super(key: key);

  CourseCards.CourseCard(
      {Key? key,
      final String? category,
      final String? name,
      final double? price,
      final double? rating,
      final double? courseCode,
      final VoidCallback? onTap})
      : _child = _CourseCard(
            category: category,
            name: name,
            price: price,
            rating: rating,
            courseCode: courseCode,
            onTap: onTap),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _child;
  }
}

class _CourseCard extends StatelessWidget {
  const _CourseCard(
      {super.key,
      this.category,
      this.name,
      this.price,
      this.rating,
      this.courseCode,
      this.onTap});
  final String? category, name;
  final double? price, rating, courseCode;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(height: 140),
        child: Row(
          children: [
            Container(
              height: 140,
              width: 130,
              color: Colors.black,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16, top: 5.5, bottom: 10),
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
                        InkWell(
                          onTap: onTap,
                          child: const Icon(
                            Icons.bookmark_border_rounded,
                            size: 26,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 1.5),
                    Text(
                      '$name',
                      style: const TextStyle(
                          color: Color(0xff202244),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    const SizedBox(height: 2.5),
                    Text(
                      '\$ ${price?.toInt()}',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff0961F5),
                      ),
                    ),
                    const SizedBox(height: 2.5),
                    Row(children: [
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
            ),
          ],
        ),
      ),
    );
  }
}

class _CompletedCourseCard extends StatelessWidget {
  const _CompletedCourseCard(
      {super.key,
      this.category,
      this.name,
      this.price,
      this.rating,
      this.courseCode,
      this.onTap});
  final String? category, name;
  final double? price, rating, courseCode;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 360,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints.expand(height: 140),
            child: Row(
              children: [
                Container(
                  height: 140,
                  width: 130,
                  color: Colors.black,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16, top: 5.5, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$category',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Color(0xffFF6B00)),
                        ),
                        const SizedBox(height: 1.5),
                        Text(
                          '$name',
                          style: const TextStyle(
                              color: Color(0xff202244),
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        const SizedBox(height: 2.5),
                        Row(
                          children: [
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
                              '${courseCode?.toInt()} Hrs Mins',
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff202244),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2.5),
                        Text(
                          'View Certificate',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff167F71),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
