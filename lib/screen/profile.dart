import 'package:flutter/material.dart';
import 'package:telead_e_learning/widget/custom_app_bar.dart';
import 'package:telead_e_learning/widget/profile_widget.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Profile'),
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              padding: const EdgeInsets.symmetric(horizontal: 21),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 80),
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
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ProfileWidget(
                            leading: Icons.person_3_outlined,
                            title: 'Edit Profile',
                          ),
                          ProfileWidget(
                            leading: Icons.account_balance_wallet_outlined,
                            title: 'Payment option',
                          ),
                          ProfileWidget(
                            leading: Icons.notifications_none,
                            title: 'Notifications',
                          ),
                          ProfileWidget(
                            leading: Icons.security_rounded,
                            title: 'Security',
                          ),
                          ProfileWidget(
                            leading: Icons.language_rounded,
                            title: 'Language',
                            trailing: Text(
                              'English (US)',
                              style: TextStyle(
                                color: Color(0xff0961F5),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          ProfileWidget(
                            leading: Icons.remove_red_eye_outlined,
                            title: 'Dark Mode',
                          ),
                          ProfileWidget(
                            leading: Icons.person_3_outlined,
                            title: 'Terms & Conditons',
                          ),
                          ProfileWidget(
                            leading: Icons.help_outline_rounded,
                            title: 'Help Center',
                          ),
                          ProfileWidget(
                            leading: Icons.mail_outline_rounded,
                            title: 'Invite Friends',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -35,
              child: Stack(
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
                    child: const Icon(
                      Icons.photo_size_select_actual_outlined,
                      color: Color(0xff167F71),
                    ),
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
