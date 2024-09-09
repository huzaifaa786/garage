import 'package:mobilegarage/models/brand_model.dart';
import 'package:mobilegarage/models/product_attachment.dart';
import 'package:mobilegarage/models/product_image.dart';

class ProductModel {
  int id;
  
  int brandId;
  int garageId;
  int categoryId;
  String serviceMinute;
  List<ProductImage> images;
  List<ProductAttachment> productAttachment;
BrandModel brands;
  ProductModel({
    required this.id,
    required this.brands,
    required this.brandId,
    required this.garageId,
    required this.categoryId,
    required this.serviceMinute,
    required this.images,
    required this.productAttachment,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      brands: BrandModel.from(json['brands']), 
      brandId: json['brand_id'],
      garageId: json['garage_id'],
      categoryId: json['category_id'],
      serviceMinute: json['service_minute'],
      images: (json['images'] as List)
          .map((item) => ProductImage.fromJson(item))
          .toList(),
      productAttachment: (json['product_attachment'] as List)
          .map((item) => ProductAttachment.fromJson(item))
          .toList(),
    );
  }
}
