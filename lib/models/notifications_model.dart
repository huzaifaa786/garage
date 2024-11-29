import 'package:mobilegarage/models/order_models/orders_model.dart';

class NotificationsModel {
  String? id;
  String? title;
  String? body;
  DateTime? createdAt;
  String? userImage;
  String? username;
  String? userId;
  String? categoryName;
  String? ordertype;
  String? status;
  SenderModel? sender;
  bool seen;
  OrdersModel? order;
  OrdersModel? requestOrder;

  NotificationsModel(
      {this.id,
      this.title,
      this.body,
      this.createdAt,
      this.userImage,
      this.categoryName,
      required this.seen,
      this.username,
      this.userId,
      this.status,
      this.order,
      this.ordertype,
      this.requestOrder,
      this.sender});

  factory NotificationsModel.fromJson(Map<String, dynamic> json) {
    return NotificationsModel(
      id: json['id']?.toString(),
      title: json['title'],
      seen: json['seen'] ?? false,
      body: json['body'],
      status: json['status'],
      ordertype: json['order_type'],
      createdAt: DateTime.parse(json['created_at']),
      userImage: json['sender'] != null ? json['sender']['image'] : '',
      userId: json['sender'] != null ? json['sender']['id'] : '',
      username: json['sender'] != null ? json['sender']['name'] : '',
      categoryName: json['order'] != null &&
              json['order']['items'] != null &&
              json['order']['items'].isNotEmpty &&
              (json['order']['items'] as List).isNotEmpty
          ? json['order']['items'][0]['products']['category']['name']
          : null,
      order: json['order'] != null ? OrdersModel.fromJson(json['order']) : null,
      requestOrder: json['request_order'] != null
          ? OrdersModel.fromJson(json['request_order'])
          : null,
      sender:
          json['sender'] != null ? SenderModel.fromJson(json['sender']) : null,
    );
  }
}

class SenderModel {
  String? id;
  String? name;

  SenderModel({
    this.id,
    this.name,
  });

  factory SenderModel.fromJson(Map<String, dynamic> json) {
    return SenderModel(
      id: json['id'].toString(),
      name: json['name'].toString(),
    );
  }
}
