import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class OffersCard extends StatelessWidget {
  const OffersCard({super.key, this.percentage});
  final int? percentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: const Color(0xff0961F5),
        image: const DecorationImage(
            image: AssetImage('assets/images/saleCard.png'), fit: BoxFit.fill),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 18.0, right: 18.0, top: 28, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$percentage% Off*',
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
            ),
            const Spacer(flex: 1),
            Text(
              'Today’s Special',
              style: const TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            const SizedBox(
              width: 170,
              child: Wrap(
                children: [
                  Text(
                    'Get a Discount for Every Course Order only Valid for Today.!',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(flex: 10),
            DotsIndicator(
              mainAxisSize: MainAxisSize.max,
              position: 2,
              dotsCount: 5,
              decorator: DotsDecorator(
                size: const Size.square(8.0),
                color: const Color(0xff1A6EFC),
                activeColor: const Color(0xffFAC840),
                activeSize: const Size(18.0, 8.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
