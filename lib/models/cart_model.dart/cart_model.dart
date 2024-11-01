import 'package:mobilegarage/models/brand_model.dart';
import 'package:mobilegarage/models/fuel_models/fuel_extra_model.dart';
import 'package:mobilegarage/models/oil_models/extra_model.dart';
import 'package:mobilegarage/models/product_image.dart';
import 'package:mobilegarage/models/product_model.dart';
import 'package:mobilegarage/models/user_vehicles.dart';

class CartModel {
  int? id;
  String? userId;
  int? garageId;
  String? totalAmount;
  int? totalQuantity;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<CartItemModel>? items;
  UserVehicles? vehicle;

  CartModel(
      {this.id,
      this.userId,
      this.garageId,
      this.totalAmount,
      this.totalQuantity,
      this.createdAt,
      this.updatedAt,
      this.items,
      this.vehicle});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
        id: json['id'],
        userId: json['user_id'],
        garageId: json['garage_id'],
        totalAmount: json['total_amount'],
        totalQuantity: json['total_quantity'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
        items: json['items'] != null
            ? List<CartItemModel>.from(
                json['items'].map((item) => CartItemModel.fromJson(item)))
            : null,
        vehicle: UserVehicles.fromJson(json['vehicles']));
  }
}

class CartItemModel {
  int? id;
  int? cartId;
  int? productId;
  int? productExtraId;
  int? quantity;
  String? price;
  DateTime? createdAt;
  DateTime? updatedAt;
  ProductModel? cartProduct;
  List<ProductImage>? images;
  List<OilExtraModel>? oilextra = [];
//
  // List<RecoveryExtraModel>? recoveryextra = [];

//
  // List<FuelExtraModel>? fuelextra = [];

  FuelExtraModel? fuelextra;
  BrandModel? brand;

//
  // List<RoadAssistanceExtraModel>? roadextra = [];

//
  // List<CarWashExtraModel>? carwashextra = [];

//
  // List<AcExtraModel>? acextra = [];

  CartItemModel({
    this.id,
    this.cartId,
    this.productId,
    this.productExtraId,
    this.quantity,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.cartProduct,
    this.brand,
    // this.acextra,
    // this.carwashextra,
    this.fuelextra,
    this.oilextra,
    // this.recoveryextra,
    // this.roadextra,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['id'],
      cartId: json['cart_id'],
      productId: json['product_id'],
      productExtraId: json['product_extra_id'],
      quantity: json['quantity'],
      price: json['price'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      cartProduct: json['product'] != null
          ? ProductModel.fromJson(json['product'])
          : null,
      oilextra: json['product_extra'] != null
          ? [OilExtraModel.from(json['product_extra'])]
          : [],
      fuelextra: json['product_extra'] != null
          ? FuelExtraModel.from(json['product_extra'])
          : null,
      brand: json['product']['brand'] != null
          ? BrandModel.from(json['product']['brand'])
          : null,
      // recoveryextra: json['product_extra'] != null
      //     ? [
      //         RecoveryExtraModel.from(json['product_extra'])
      //       ] // Changed to handle a single object and wrap it in a list
      //     : [],
      // fuelextra: json['product_extra'] != null
      //     ? [
      //         FuelExtraModel.from(json['product_extra'])
      //       ] // Changed to handle a single object and wrap it in a list
      //     : [],
      // roadextra: json['product_extra'] != null
      //     ? [
      //         RoadAssistanceExtraModel.from(json['product_extra'])
      //       ] // Changed to handle a single object and wrap it in a list
      //     : [],
      // carwashextra: json['product_extra'] != null
      //     ? [
      //         CarWashExtraModel.from(json['product_extra'])
      //       ] // Changed to handle a single object and wrap it in a list
      //     : [],
      // acextra: json['product_extra'] != null
      //     ? [
      //         AcExtraModel.from(json['product_extra'])
      //       ] // Changed to handle a single object and wrap it in a list
      //     : [],
    );
  }
}


// class CartProduct {
//   int? id;
//   int? garageId;
//   int? categoryId;
//   String? description;
//   String? price;
//   List<ProductImage>? productImages;

//   CartProduct({
//     this.id,
//     this.garageId,
//     this.categoryId,
//     this.description,
//     this.price,
//     this.productImages,
//   });

//   factory CartProduct.fromJson(Map<String, dynamic> json) {
//     return CartProduct(
//       id: json['id'],
//       garageId: json['garage_id'],
//       categoryId: json['category_id'],
//       description: json['description'],
//       price: json['price'],
//       productImages: json['product_images'] != null
//           ? List<ProductImage>.from(json['product_images']
//               .map((image) => ProductImage.fromJson(image)))
//           : null,
//     );
//   }
// }
