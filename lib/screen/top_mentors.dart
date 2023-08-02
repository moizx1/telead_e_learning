import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:telead_e_learning/widget/custom_app_bar.dart';
import 'package:telead_e_learning/widget/mentor_card.dart';

class TopMentors extends StatelessWidget {
  const TopMentors({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Top Mentors', showSearchIcon: true),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: ListView.builder(
            itemCount: 7,
            itemBuilder: (context, index) {
              return MentorCard(
                  category: '3D Design', name: 'Donald S. Channel');
            },
          )),
    );
  }
}
