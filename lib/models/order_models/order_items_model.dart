import 'package:mobilegarage/models/product_model.dart';

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
  });

  factory OrderItemsModel.fromJson(Map<String, dynamic> json) {
    return OrderItemsModel(
      id: json['id']?.toString(),
      orderId: json['order_id']?.toString(),
      productId: json['product_id']?.toString(),
      productExtraId: json['product_extra_id']?.toString(),
      price: json['item_price']?.toString(),
      quantity: json['item_quantity']?.toString(),
      userVehicleId: json['user_vehicle_id']?.toString(),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      products: ProductModel.fromJson(json['products']),
      productsExtra: ProductExtraModel.fromJson(json['product_extra']),
    );
  }
}
