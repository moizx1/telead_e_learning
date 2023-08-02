import 'package:flutter/material.dart';
import 'package:telead_e_learning/widget/mentor_card.dart';

class SingleCourseDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 237, 244, 255),
        body: CustomScrollView(
          slivers: [
            // SliverPersistentHeader(
            //   delegate: MySliverAppBar(expandedHeight: 400),
            //   pinned: true,
            // ),
            SliverAppBar(
              // deleg
              pinned: true,
              expandedHeight: 400.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: Colors.black,
                ),
              ),
            ),

            SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  Padding(
                    padding: const EdgeInsets.only(top: 38.0),
                    child: Stack(
                      clipBehavior: Clip.none,
                      fit: StackFit.passthrough,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 50, bottom: 20),
                          height: 394,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Graphics Design',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: Color(0xffFF6B00)),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star_rounded,
                                          color: Color(0xffFAC025),
                                          size: 18,
                                        ),
                                        Text(
                                          '4.2',
                                          style: const TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff202244),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 7.5),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25.0),
                                child: Text(
                                  'Advanced Graphic Design',
                                  style: const TextStyle(
                                      color: Color(0xff202244),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25.0),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.video_camera_back_outlined,
                                            color: Color(0xff1D1D1B),
                                            size: 18,
                                          ),
                                          Text(
                                            '21 Class',
                                            style: const TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff202244),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          const Text('|'),
                                          const SizedBox(width: 10),
                                          const Icon(
                                            Icons.watch_later_outlined,
                                            color: Color(0xff1D1D1B),
                                            size: 18,
                                          ),
                                          Text(
                                            '42 Hours',
                                            style: const TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff202244),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '\$25',
                                        style: const TextStyle(
                                          fontSize: 21,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff0961F5),
                                        ),
                                      ),
                                    ]),
                              ),
                              const SizedBox(height: 7.5),
                              Container(
                                height: 52,
                                decoration: BoxDecoration(
                                  color: Color(0xffE8F1FF),
                                  border: Border.all(
                                    width: 3,
                                    color: Color(0xffE8F1FF),
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        color: Color(0xffF5F9FF),
                                        child: Text(
                                          'About',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff202244),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        color: Color(0xffE8F1FF),
                                        child: Text(
                                          textAlign: TextAlign.center,
                                          'Curriculum',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff202244),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 15),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25.0),
                                child: Text(
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffA0A4AB),
                                    ),
                                    'Graphic Design now a popular profession graphic design by off your carrer about tantas regiones barbarorum pedibus obiit'),
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25.0),
                                child: Text(
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffA0A4AB),
                                    ),
                                    'Graphic Design n a popular profession l Cur tantas regiones barbarorum pedibus obiit, maria transmi Et ne nimium beatus est; Addidisti ad extremum etiam Read More'),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: -30,
                          right: 10,
                          child: Container(
                            height: 63,
                            width: 63,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff167F71),
                            ),
                            child: Icon(
                              Icons.play_circle_outline,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Mentor',
                    style: TextStyle(),
                  ),
                  MentorCard(
                    name: 'William S. Cunningham',
                    category: 'Graphic Design',
                  ),
                  Text(
                    'Mentor',
                    style: TextStyle(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class MySliverAppBar extends SliverPersistentHeaderDelegate {
//   final double expandedHeight;

//   MySliverAppBar({required this.expandedHeight});

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return Stack(
//       fit: StackFit.expand,
//       clipBehavior: Clip.none,
//       children: [
//         Container(
//           color: Colors.black,
//         ),
//         Positioned(
//           top: expandedHeight / 1.1 - shrinkOffset,
//           right: 30,
//           // top: 100,
//           // left: MediaQuery.of(context).size.width / 4,
//           left: 30,
          // child: 
//         ),
//       ],
//     );
//   }

//   @override
//   double get maxExtent => expandedHeight;

//   @override
//   double get minExtent => kToolbarHeight;

//   @override
//   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;

