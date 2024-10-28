import 'package:flutter/material.dart';

class NotificationsModel {
  String? id;
  String? title;
  String? body;
  DateTime? createdAt;
  Image? userImage;
  String? categoryName;

  NotificationsModel({
    this.id,
    this.title,
    this.body,
    this.createdAt,
    this.userImage,
    this.categoryName,
  });

  factory NotificationsModel.fromJson(Map<String, dynamic> json) {
    return NotificationsModel(
      id: json['id'].toString(),
      title: json['title'],
      body: json['body'],
      createdAt: DateTime.parse(json['created_at']),
      userImage:
          json['user_image'] != null ? Image.network(json['user_image']) : null,
      categoryName:
          json['category_name'] != null ? json['category_name'] : null,
    );
  }
}
