import 'package:mobilegarage/models/order_models/order_items_model.dart';
import 'package:mobilegarage/models/user_model.dart';

class OrdersModel {
  String? id;
  String? status;
  String? userId;
  String? garageId;
  String? totalAmount;
  String? totalQuantity;
  String? paymentStatus;
  String? orderType;
  String? paymentIntent;
  String? paymentMethod;
  String? subTotal;
  String? discountTotal;
  String? deliveryTime;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<OrderItemsModel>? orderItems;
  UserModel? user;

  OrdersModel({
    this.id,
    this.status,
    this.userId,
    this.garageId,
    this.totalAmount,
    this.totalQuantity,
    this.paymentStatus,
    this.orderType,
    this.paymentIntent,
    this.paymentMethod,
    this.discountTotal,
    this.deliveryTime,
    this.subTotal,
    this.createdAt,
    this.updatedAt,
    this.orderItems,
    this.user,
  });

  factory OrdersModel.fromJson(Map<String, dynamic> json) {
    return OrdersModel(
        id: json['id']?.toString(),
        status: json['status'],
        userId: json['user_id']?.toString(),
        garageId: json['garage_id']?.toString(),
        totalAmount: json['total_amount']?.toString(),
        totalQuantity: json['total_quantity']?.toString(),
        paymentStatus: json['payment_status'],
        orderType: json['order_type'],
        paymentIntent: json['payment_intent'],
        paymentMethod: json['payment_method'],
        discountTotal: json['discount_total']?.toString(),
        deliveryTime: json['delivery_time'],
        subTotal: json['sub_total']?.toString(),
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
        orderItems: (json['items'] as List)
            .map((item) => OrderItemsModel.fromJson(item))
            .toList(),
        user: json['user'] != null ? UserModel.fromJson(json['user']) : null);
  }
}
