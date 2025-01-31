class OilProductTTypeModel {
  int id;
  int categoryId;
  String? producttype;
  String? ar_producttype;
  String? createdAt;

  OilProductTTypeModel(
      {required this.id,
      required this.categoryId,
      this.producttype,
      this.createdAt,
      this.ar_producttype});

  factory OilProductTTypeModel.from(Map<String, dynamic> json) {
    return OilProductTTypeModel(
      id: json['id'],
      categoryId: json['category_id'],
      producttype: json['product_type'],
      ar_producttype: json['ar_name'],
      createdAt: json['created_at'],
    );
  }
}
