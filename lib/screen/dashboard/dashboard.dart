import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/dashboard/dashboard_controller.dart';
import 'home/home.dart';
import 'inbox/inbox.dart';
import 'my_courses/my_courses.dart';
import 'profile/profile.dart';
import 'transactions/transactions.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
        init: DashboardController(),
        builder: (controller) {
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.currentIndex,
              onTap: controller.updateIndex,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_rounded), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.edit_document), label: 'My Courses'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.message_outlined), label: 'Inbox'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.wallet_outlined), label: 'Transaction'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_outlined), label: 'Profile'),
              ],
              showUnselectedLabels: true,
              unselectedItemColor: Color(0xff202244),
              selectedItemColor: Color(0xff167F71),
              unselectedFontSize: 12,
              selectedFontSize: 12,
              type: BottomNavigationBarType.fixed,
            ),
            body: IndexedStack(
              index: controller.currentIndex,
              children: [
                Home(),
                MyCourses(),
                Inbox(),
                Transactions(),
                Profile(),
              ],
            ),
          );
        });
  }
}
