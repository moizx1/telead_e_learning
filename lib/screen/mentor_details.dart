import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:telead_e_learning/widget/custom_app_bar.dart';

class MentorDetails extends StatelessWidget {
  const MentorDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(color: Colors.white),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  // alignment: Alignment.center,
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                ),
                Text(
                  'Christopher J. Levine',
                  style: TextStyle(
                    color: Color(0xff202244),
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Graphic Designer At Google',
                  style: TextStyle(
                    color: Color(0xff545454),
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
