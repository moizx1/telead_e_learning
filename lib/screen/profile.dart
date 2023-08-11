import 'package:flutter/material.dart';
import 'package:telead_e_learning/widget/custom_app_bar.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Profile'),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                    color: const Color(0xffD8D8D8),
                    border: Border.all(
                      color: const Color(0xff167F71),
                      width: 4,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xff167F71),
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.photo_size_select_actual_outlined,
                    color: Color(0xff167F71),
                  ),
                ),
              ],
            ),
            Text(
              'James S. Hernandez',
              style: TextStyle(
                color: Color(0xff202244),
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'hernandex.redial@gmail.ac.in',
              style: TextStyle(
                color: Color(0xff202244),
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.person_3_outlined,
                      size: 26,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Edit Profile',
                      style: TextStyle(
                        color: Color(0xff202244),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Icon(Icons.arrow_forward_ios_rounded, size: 24),
              ],
            )
          ],
        ),
      ),
    );
  }
}
