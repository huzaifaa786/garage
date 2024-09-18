
class OilProductTTypeModel {
  int id;
  int categoryId;
  String? producttype;
  String? createdAt;

  OilProductTTypeModel({
    required this.id,
    required this.categoryId,
    this.producttype,
    this.createdAt,
  });

  factory OilProductTTypeModel.from(Map<String, dynamic> json) {
    return OilProductTTypeModel(
      id: json['id'],
      categoryId: json['category_id'],
      producttype: json['product_type'],
      createdAt: json['created_at'],
    );
  }
}
