import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, this.haveBackground = false});
  final bool haveBackground;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: haveBackground
          ? const EdgeInsets.only(top: 17.5, bottom: 15, left: 17.5, right: 17.5)
          : null,
      height: haveBackground ? 154 : null,
      decoration: BoxDecoration(
        color: haveBackground ? Colors.white : null,
        borderRadius: haveBackground ? BorderRadius.circular(16) : null,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 46,
            width: 46,
            decoration:const  BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
          ),
         const  SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 140,
                      child: Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        'William S. Cunninghammmmm',
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff202244),
                        ),
                      ),
                    ),
                    Container(
                      // alignment: Alignment.center,
                      height: 26,
                      width: 60,
                      decoration: BoxDecoration(
                        color: const Color(0xffE8F1FF),
                        borderRadius: BorderRadius.circular(13),
                        border:
                            Border.all(color:const  Color(0xff4D81E5), width: 2.5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star_rounded,
                            size: 15,
                            color: Color(0xffFF9C07),
                          ),
                          Text(
                            '4.5',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff202244),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    'The Course is Very Good dolor sit amet, consect tur adipiscing elit. Naturales divitias dixit parab les esse, quod parvo'),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite,
                          size: 15,
                          color: Colors.red,
                        ),
                        SizedBox(width: 7.5),
                        Text(
                          '578',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff202244),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 30),
                    Text(
                      '2 Weeks Ago',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff202244),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
