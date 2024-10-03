class FuelExtraModel {
  int? id;
  int? categoryId;
  String? name;
  String? description;
  String? price;
  String? time;
  String? createdAt;

  FuelExtraModel(
      {this.id,
      this.categoryId,
      this.name,
      this.description,
      this.price,
      this.createdAt,
      this.time});

  factory FuelExtraModel.from(Map<String, dynamic> json) {
    return FuelExtraModel(
      id: json['id'] ?? 0,
      categoryId: json['category_extra_id'] ?? 0,
      name: json['category_extra']['name'] ?? '',
      time: json['time'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? '',
      createdAt: json['created_at'] ?? '',
    );
  }
}
