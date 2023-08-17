import 'package:flutter/material.dart';
import 'package:telead_e_learning/widget/custom_checkbox.dart';

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
      final VoidCallback? onBookmarkTap,
      onCourseTap})
      : _child = _CourseCard(
            category: category,
            name: name,
            price: price,
            rating: rating,
            courseCode: courseCode,
            onCourseTap: onCourseTap,
            onBookmarkTap: onBookmarkTap),
        super(key: key);

  CourseCards.CompletedCourseCard({
    Key? key,
    final String? category,
    final String? name,
    final String? time,
    final double? rating,
  })  : _child = _CompletedCourseCard(
            category: category, name: name, rating: rating, time: time),
        super(key: key);

  CourseCards.OngoingCourseCard({
    Key? key,
    final String? category,
    final String? name,
    final String? time,
    required final double rating,
    required final double remaining,
    required final double total,
  })  : _child = _OngoingCourseCard(
            category: category,
            name: name,
            rating: rating,
            time: time,
            remaining: remaining,
            total: total),
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
      this.onCourseTap,
      this.onBookmarkTap});
  final String? category, name;
  final double? price, rating, courseCode;
  final VoidCallback? onBookmarkTap, onCourseTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCourseTap,
      child: Container(
        width: 360,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints.expand(height: 140),
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
                            onTap: onBookmarkTap,
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
      ),
    );
  }
}

class _OngoingCourseCard extends StatelessWidget {
  const _OngoingCourseCard(
      {super.key,
      this.category,
      this.name,
      this.time,
      required this.rating,
      required this.remaining,
      required this.total});
  final String? category, name, time;
  final double rating, total, remaining;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints.expand(height: 134),
        child: Row(
          children: [
            Container(
              height: 134,
              width: 130,
              color: Colors.black,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16, top: 5.5, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category ?? '',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Color(0xffFF6B00)),
                    ),
                    const SizedBox(height: 1.5),
                    Text(
                      name ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Color(0xff202244),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    const SizedBox(height: 7.5),
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: Color(0xffFAC025),
                          size: 18,
                        ),
                        Text(
                          rating.toString(),
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
                          '${time} Hrs Mins',
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff202244),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2.5),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Container(
                            height: 8,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xffE8F1FF),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: LinearProgressIndicator(
                                backgroundColor: const Color(0xffF5F9FF),
                                value: (remaining / total),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '${remaining.toInt()}/${total.toInt()}',
                          style: const TextStyle(
                              color: Color(0xff202244),
                              fontSize: 11,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 5),
                      ],
                    )
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
  const _CompletedCourseCard({
    super.key,
    this.category,
    this.name,
    this.time,
    this.rating,
  });
  final String? category, name, time;
  final double? rating;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints.expand(height: 134),
            child: Row(
              children: [
                Container(
                  height: 134,
                  width: 130,
                  color: Colors.black,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16, top: 5.5, bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          category ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Color(0xffFF6B00)),
                        ),
                        const SizedBox(height: 1.5),
                        Text(
                          name ?? '',
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
                              rating.toString(),
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
                              '${time} Hrs Mins',
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff202244),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2.5),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'View Certificate',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff167F71),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            SizedBox(width: 7.5),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 20,
          top: -7.5,
          child: CustomCheckBox.circle(isChecked: true),
        ),
      ],
    );
  }
}
