import 'package:flutter/material.dart';

import 'custom_listview_tile.dart';

class CallsBuilder extends StatelessWidget {
  const CallsBuilder({super.key, this.onTrailingTap});
  final VoidCallback? onTrailingTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 10),
      shrinkWrap: true,
      itemCount: 15,
      itemBuilder: (context, index) {
        return CustomListviewTile(
          title: 'Patricia D. Regalado',
          description: Row(
            children: [
              Icon(
                Icons.add_box_outlined,
                color: Color(0xff332DA1),
                size: 22,
              ),
              const SizedBox(width: 7.5),
              Text(
                'Incoming  |  Nov 03,2023',
                style: TextStyle(
                  color: Color(0xff545454),
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          trailing: IconButton(
            onPressed: onTrailingTap,
            icon: const Icon(
              Icons.add_ic_call_outlined,
              color: Color(0xff0961F5),
              size: 23,
            ),
          ),
        );
      },
    );
  }
}
