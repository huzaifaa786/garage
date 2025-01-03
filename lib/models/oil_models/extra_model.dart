class OilExtraModel {
  int? id;
  int? categoryId;
  String? name;
  String? ar_name;

  String? description;
  String? price;
  String? createdAt;

  OilExtraModel({
    this.id,
    this.categoryId,
    this.name,
    this.description,
    this.price,
    this.createdAt,
    this.ar_name
  });

  factory OilExtraModel.from(Map<String, dynamic> json) {
    return OilExtraModel(
      id: json['id'] ?? 0,
      categoryId: json['category_extra_id'] ?? 0,
      name:  json['category_extra'] != null? json['category_extra']['name'] : json['name']??'',
      ar_name:  json['category_extra'] != null? json['category_extra']['ar_name'] : json['ar_name']??'',
      description: json['description'] ?? '',
      price: json['price'] ?? '',
      createdAt: json['created_at'] ?? '',
    );
  }
}
