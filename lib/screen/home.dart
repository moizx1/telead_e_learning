import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text('Hi, Ronald A. Martin'),
                  Icon(Icons.notifications_none_rounded)
                ],
              ),
              SearchBar(
                elevation: MaterialStatePropertyAll(2.5),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
                surfaceTintColor: MaterialStatePropertyAll(Color(0xffFFFFFF)),
                leading: Icon(Icons.search_rounded),
                hintText: 'Search For...',
                trailing: <Widget>[
                  Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff0961F5)),
                    child: Icon(
                      Icons.filter_list,
                      color: Color(0xffE8F1FF),
                      size: 22,
                    ),
                  ),
                ],
              ),
              Container(
                height: 180,
                width: 350,
                decoration: BoxDecoration(
                  color: Color(0xff0961F5),
                  image: DecorationImage(
                      image: AssetImage('assets/images/saleCard.png'),
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 18.0, right: 18.0, top: 28, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '25% Off*',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Spacer(flex: 1),
                      Text(
                        'Today’s Special',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Spacer(
                        flex: 2,
                      ),
                      Container(
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
                      Spacer(flex: 10),
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
              ),
//reusable card
              Container(
                  height: 240,
                  width: 280,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
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
                                  'Graphics Design',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Color(0xffFF6B00)),
                                ),
                                Icon(
                                  Icons.bookmark_border_rounded,
                                  size: 26,
                                )
                              ],
                            ),
                            Text(
                              'Graphics Design Advanced',
                              style: TextStyle(
                                  color: Color(0xff202244),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            SizedBox(height: 7.5),
                            Row(children: [
                              Text(
                                '\$28',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff0961F5),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text('|'),
                              SizedBox(width: 10),
                              Icon(
                                Icons.star_rounded,
                                color: Color(0xffFAC025),
                                size: 18,
                              ),
                              Text(
                                '4.2',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff202244),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text('|'),
                              SizedBox(width: 10),
                              Text(
                                '7830 Std',
                                style: TextStyle(
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
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
