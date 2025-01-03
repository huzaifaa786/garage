import 'package:mobilegarage/models/product_model.dart';

class CategoryModel {
  int id;
  String? name;
  String? ar_name;
  String? image;
  List<ProductModel>? product;

  CategoryModel({
    required this.id,
    this.name,
    this.image,
     this.product,
     this.ar_name
  });
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      ar_name: json['ar_name'],
      image: json['image'],
      product: json['products'] != null
          ? (json['products'] as List)
              .map((item) => ProductModel.fromJson(item))
              .toList()
          : null,
    );
  }
}
