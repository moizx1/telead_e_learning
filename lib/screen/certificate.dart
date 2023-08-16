import 'package:flutter/material.dart';

import '../widget/custom_app_bar.dart';

class Certificate extends StatelessWidget {
  const Certificate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: '3D Design Illustration',
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: const DecorationImage(
            image: AssetImage('assets/images/certificate.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            Text(
              'Certificate of Completions',
              style: const TextStyle(
                color: Color(0xff202244),
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            Text('This Certifies that'      style: const TextStyle(
                        color: Color(0xff202244),
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),),
            Text('Calvin E. McGinnis'      style: const TextStyle(
                        color: Color(0xff202244),
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),),
            Text(
                'Has Successfully Completed the Wallace Training Program, Entitled.'      style: const TextStyle(
                        color: Color(0xff202244),
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),),
            Text('3D Design Illustration Course'      style: const TextStyle(
                        color: Color(0xff202244),
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),),
            Text('Issued on November 24, 2022'),
            Text('ID: SK24568086'),
            Text('Issued on November 24, 2022'),
          ],
        ),
      ),
    );
  }
}
