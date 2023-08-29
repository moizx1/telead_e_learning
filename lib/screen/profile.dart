import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telead_e_learning/services/AuthProvider.dart';
import 'package:telead_e_learning/widget/custom_app_bar.dart';
import 'package:telead_e_learning/widget/profile_widget.dart';

import '../constants/app_keys.dart';
import '../constants/constant.dart';
import '../controller/profile_controller.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
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
                                  onTap: () => controller.onTileTap(
                                      route: '/editProfile'),
                                  leading: Icons.person_3_outlined,
                                  title: 'Edit Profile',
                                ),
                                ProfileWidget(
                                  onTap: () => controller.onTileTap(
                                      route: '/paymentOptions'),
                                  leading:
                                      Icons.account_balance_wallet_outlined,
                                  title: 'Payment option',
                                ),
                                ProfileWidget(
                                  onTap: () => controller.onTileTap(
                                      route: '/notificationSettings'),
                                  leading: Icons.notifications_none,
                                  title: 'Notifications',
                                ),
                                ProfileWidget(
                                  onTap: () =>
                                      controller.onTileTap(route: '/security'),
                                  leading: Icons.security_rounded,
                                  title: 'Security',
                                ),
                                ProfileWidget(
                                  onTap: () =>
                                      controller.onTileTap(route: '/language'),
                                  leading: Icons.language_rounded,
                                  title: 'Language',
                                  trailing: Text(
                                    'English (US)',
                                    style: const TextStyle(
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
                                  onTap: () =>
                                      controller.onTileTap(route: '/terms'),
                                  leading: Icons.person_3_outlined,
                                  title: 'Terms & Conditons',
                                ),
                                ProfileWidget(
                                  leading: Icons.help_outline_rounded,
                                  title: 'Help Center',
                                ),
                                ProfileWidget(
                                  onTap: () => controller.onTileTap(
                                      route: '/inviteFriends'),
                                  leading: Icons.mail_outline_rounded,
                                  title: 'Invite Friends',
                                ),
                                ProfileWidget(
                                  onTap: () async {
                                    try {
                                      await AuthProvider().firebaseSignOut();
                                      await AuthProvider().googleSignOut();
                                      getStorage.remove(AppKeys.userData);
                                      Get.offNamed('/authOptions');
                                    } catch (e) {
                                      print(e);
                                    }
                                  },
                                  leading: Icons.logout_rounded,
                                  title: 'Log Out',
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
        });
  }
}
