import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:telead_e_learning/dummy_data.dart';
import 'package:telead_e_learning/model/notification_model.dart';
import 'package:telead_e_learning/widgets/custom_app_bar.dart';
import 'package:telead_e_learning/widgets/notification_card.dart';

class Notifications extends StatelessWidget {
  Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Notifications'),
      body: GroupedListView<dynamic, String>(
        elements: DummyData.dummyData,
        groupBy: (element) => element.date,
        groupComparator: (value1, value2) => value2.compareTo(value1),
        itemComparator: (item1, item2) =>
            item1.description.compareTo(item2.description),
        order: GroupedListOrder.DESC,
        // useStickyGroupSeparators: true,
        groupSeparatorBuilder: (String value) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        itemBuilder: (c, element) {
          return NotificationCard();
        },
      ),
    );
  }
}
