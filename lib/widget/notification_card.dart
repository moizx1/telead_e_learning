import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 100,
      decoration: BoxDecoration(
        color: Color(0xffE8F1FF),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Color(0xffB4BDC4), width: 2),
      ),
      child: Row(
        children: [
          Container(
            height: 52,
            width: 52,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffF5F9FF),
            ),
            child: Icon(Icons.discount),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Today’s Special Offers',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: TextStyle(
                    color: Color(0xff202244),
                    fontSize: 19,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                'You Have made a Coure Payment.',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: TextStyle(
                    color: Color(0xff545454),
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}
