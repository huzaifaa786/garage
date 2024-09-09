import 'package:mobilegarage/models/product_model.dart';

class CategoryModel {
  int id;
  String? name;
  String? image;
  List<Product> product;

  CategoryModel({
    required this.id,
    this.name,
    this.image,
    required this.product,
  });
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      product: (json['product'] as List)
          .map((item) => Product.fromJson(item))
          .toList(),
    );
  }
}
