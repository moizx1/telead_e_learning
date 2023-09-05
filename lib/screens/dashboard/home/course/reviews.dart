import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telead_e_learning/widgets/custom_app_bar.dart';
import 'package:telead_e_learning/widgets/custom_button.dart';
import 'package:telead_e_learning/widgets/custom_horizontal_list.dart';
import 'package:telead_e_learning/widgets/review_card.dart';

class Reviews extends StatelessWidget {
  const Reviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Reviews'),
      body: Column(
        children: [
          Text(
            '4.8',
            style: TextStyle(
                color: Color(0xff202244),
                fontSize: 38,
                fontWeight: FontWeight.w600),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, color: Color(0xffFF9C07), size: 22),
              Icon(Icons.star, color: Color(0xffFF9C07), size: 22),
              Icon(Icons.star, color: Color(0xffFF9C07), size: 22),
              Icon(Icons.star, color: Color(0xffFF9C07), size: 22),
              Icon(Icons.star, color: Color(0xffFF9C07), size: 22),
            ],
          ),
          Text(
            'Based on 448 Reviews',
            style: TextStyle(
              color: Color(0xff545454),
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 28),
            child: CustomHorizontalList(
              onTap: (v) {},
              titles: ['Excellent', 'Good', 'Average', 'Below Average'],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 28),
              child: Stack(
                // fit: StackFit.passthrough,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: ReviewCard(haveBackground: true),
                      );
                    },
                  ),
                  Positioned(
                    bottom: 7.5,
                    left: 10,
                    right: 10,
                    child: CustomButton(label: 'Write a Review',onPress: ()=>Get.toNamed('/writeReview')),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 7.5),
        ],
      ),
    );
  }
}
