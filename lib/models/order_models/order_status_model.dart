import 'package:mobilegarage/models/order_models/orders_model.dart';

class OrderProgressModel {
  NewOrdersModel? newOrders;
  List<OrdersModel>? inProgressOrders;
  List<OrdersModel>? completedOrders;
  List<OrdersModel>? cancelledOrders;

  OrderProgressModel({
    this.newOrders,
    this.inProgressOrders,
    this.completedOrders,
    this.cancelledOrders,
  });

  factory OrderProgressModel.fromJson(Map<String, dynamic> json) {
    return OrderProgressModel(
      newOrders: json['new_orders'] != null
          ? NewOrdersModel.fromJson(json['new_orders'])
          : null,
      inProgressOrders: (json['ON_THE_WAY'] as List?)
          ?.map((order) => OrdersModel.fromJson(order))
          .toList(),
      completedOrders: (json['DELIVERED'] as List?)
          ?.map((order) => OrdersModel.fromJson(order))
          .toList(),
      cancelledOrders: (json['REJECTED'] as List?)
          ?.map((order) => OrdersModel.fromJson(order))
          .toList(),
    );
  }
}

class NewOrdersModel {
  List<OrdersModel>? pendingOrders;
  List<OrdersModel>? acceptedOrders;

  NewOrdersModel({
    this.pendingOrders,
    this.acceptedOrders,
  });

  factory NewOrdersModel.fromJson(Map<String, dynamic> json) {
    return NewOrdersModel(
      pendingOrders: (json['PENDING'] as List?)
          ?.map((order) => OrdersModel.fromJson(order))
          .toList(),
      acceptedOrders: (json['ACCEPTED'] as List?)
          ?.map((order) => OrdersModel.fromJson(order))
          .toList(),
    );
  }
}
