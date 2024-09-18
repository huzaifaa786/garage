class OilExtraModel {
  int id;
  int categoryId;
  String? name;
  String? description;
  String? price;
  String? createdAt;

  OilExtraModel({
    required this.id,
    required this.categoryId,
    this.name,
    this.description,
    this.price,
    this.createdAt,
  });

  factory OilExtraModel.from(Map<String, dynamic> json) {
    return OilExtraModel(
      id: json['id'],
      categoryId: json['category_id'],
      name: json['name'],
      createdAt: json['created_at'],
    );
  }
}
