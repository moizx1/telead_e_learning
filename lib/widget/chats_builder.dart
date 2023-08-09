import 'package:flutter/material.dart';

import 'custom_listview_tile.dart';

class ChatsBuilder extends StatelessWidget {
  const ChatsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 10),
      shrinkWrap: true,
      itemCount: 15,
      itemBuilder: (context, index) {
        return CustomListviewTIle(
          title: 'Virginia M. Patterson',
          description: Text(
            'Hi, Good Evening Bro.!',
            style: TextStyle(
              color: Color(0xff545454),
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 24,
                width: 24,
                decoration: const BoxDecoration(
                  color: Color(0xff0961F5),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '03',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                '14:39',
                style: TextStyle(
                  color: Color(0xff545454),
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
