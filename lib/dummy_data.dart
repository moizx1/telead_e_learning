import 'package:flutter/material.dart';
import 'package:telead_e_learning/model/notification_model.dart';

class DummyData {
  
  static List<NotificationModel> dummyData = [
    NotificationModel(
      icon: Icons.discount,
      title: 'New Category Course.!',
      description: 'New the 3D Design Course is Availa…',
      date: '02/08/2023',
    ),
    NotificationModel(
      icon: Icons.discount,
      title: 'Today\'s Special Offers',
      description: 'You Have made a Coure Payment.',
      date: '01/08/2023',
    ),
    NotificationModel(
      icon: Icons.discount,
      title: 'Today\'s Special',
      description: 'You Have made a Coure Payment......',
      date: '25/07/2023',
    ),
    NotificationModel(
      icon: Icons.discount,
      title: 'New Category Course.!',
      description: 'New the 3D Design Course is Availa…',
      date: '12/07/2023',
    ),
  ];
}
