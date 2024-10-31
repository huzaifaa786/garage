import 'package:mobilegarage/models/order_models/orders_model.dart';

class NotificationsModel {
  String? id;
  String? title;
  String? body;
  DateTime? createdAt;
  String? userImage;
  String? username;
  String? categoryName;
  bool seen;
  OrdersModel? order;
  NotificationsModel(
      {this.id,
      this.title,
      this.body,
      this.createdAt,
      this.userImage,
      this.categoryName,
      required this.seen,
      this.username,
      this.order});

  factory NotificationsModel.fromJson(Map<String, dynamic> json) {
    return NotificationsModel(
        id: json['id']?.toString(),
        title: json['title'],
        seen: json['seen'] ?? false,
        body: json['body'],
        createdAt: DateTime.parse(json['created_at']),
        userImage: json['sender'] != null ? json['sender']['image'] : '',
        username: json['sender'] != null ? json['sender']['name'] : '',
        categoryName: json['category'] != null ? json['category'] : '',
        order:
            json['order'] != null ? OrdersModel.fromJson(json['order']) : null);
  }
}
