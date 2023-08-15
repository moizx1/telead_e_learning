import 'package:flutter/material.dart';
import 'package:telead_e_learning/widget/custom_app_bar.dart';
import 'package:telead_e_learning/widget/invite_card.dart';

class InviteFriends extends StatelessWidget {
  const InviteFriends({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Invite Friends'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Container(
              height: 455,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 25),
                itemCount: 6,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22.5),
                        child: InviteCard(),
                      ),
                      if (index < 5)
                        const Divider(
                          color: Color(0xffE8F1FF),
                          height: 40,
                        )
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 15),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Share Invite Via',
                style: TextStyle(
                  color: Color(0xff202244),
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Row(
              children: [
                Icon(
                  Icons.facebook,
                  color: Color(0xff4267B2),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
