class AcExtraModel {
  int? id;
  int? categoryId;
  String? name;
  String? description;
  String? price;

  String? createdAt;

  AcExtraModel(
      {this.id,
      this.categoryId,
      this.name,
      this.description,
      this.createdAt,
      this.price});

  factory AcExtraModel.from(Map<String, dynamic> json) {
    return AcExtraModel(
      id: json['id'] ?? 0,
      categoryId: json['category_extra_id'] ?? 0,
      name: json['category_extra']['name'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? '',
      createdAt: json['created_at'] ?? '',
    );
  }
}
