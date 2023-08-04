import 'package:flutter/material.dart';

class NotificationModel {
  NotificationModel({this.icon, this.title, this.description, this.date});

  IconData? icon;
  String? title, description, date;

  NotificationModel.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    title = json['title'];
    description = json['description'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['title'] = this.title;
    data['description'] = this.description;
    data['date'] = this.date;
    return data;
  }
}
