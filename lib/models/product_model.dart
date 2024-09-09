import 'package:mobilegarage/models/product_attachment.dart';
import 'package:mobilegarage/models/product_image.dart';

class Product {
  int id;
  int brands;
  int brandId;
  int garageId;
  int categoryId;
  String serviceMinute;
  List<ProductImage> images;
  List<ProductAttachment> productAttachment;

  Product({
    required this.id,
    required this.brands,
    required this.brandId,
    required this.garageId,
    required this.categoryId,
    required this.serviceMinute,
    required this.images,
    required this.productAttachment,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      brands: json['brands'],
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
