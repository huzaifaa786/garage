import 'package:mobilegarage/models/product_model.dart';
import 'package:mobilegarage/models/user_vehicles.dart';

class OrderItemsModel {
  String? id;
  String? orderId;
  String? productId;
  String? productExtraId;
  String? quantity;
  String? price;
  String? userVehicleId;
  String? orderType;
  DateTime? createdAt;
  DateTime? updatedAt;
  ProductModel? products;
  ProductExtraModel? productsExtra;
  UserVehicles? userVehicles;

  OrderItemsModel({
    this.id,
    this.orderId,
    this.productId,
    this.productExtraId,
    this.quantity,
    this.price,
    this.userVehicleId,
    this.orderType,
    this.createdAt,
    this.updatedAt,
    this.products,
    this.productsExtra,
    this.userVehicles,
  });

  factory OrderItemsModel.fromJson(Map<String, dynamic> json) {
    return OrderItemsModel(
      id: json['id']?.toString(),
      orderId: json['order_id']?.toString(),
      productId: json['product_id']?.toString(),
      productExtraId: json['product_extra_id']?.toString(),
      price: json['price']?.toString(),
      quantity: json['quantity']?.toString(),
      userVehicleId: json['user_vehicle_id']?.toString(),
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: 
      json['created_at'] != null?
      DateTime.parse(json['updated_at']): null,
      products: ProductModel.fromJson(json['products']),
      productsExtra: json['product_extra'] != null
          ? ProductExtraModel.fromJson(json['product_extra'])
          : null,
      userVehicles:json['user_vehicle']!=null? UserVehicles.fromJson(json['user_vehicle']):null,
    );
  }
}
