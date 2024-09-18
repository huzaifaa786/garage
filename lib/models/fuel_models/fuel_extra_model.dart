class FuelExtraModel {
  int id;
  int categoryId;
  String? name;
  String? description;
  String? price;
  String? time;
  String? createdAt;

  FuelExtraModel(
      {required this.id,
      required this.categoryId,
      this.name,
      this.description,
      this.price,
      this.createdAt,
      this.time});

  factory FuelExtraModel.from(Map<String, dynamic> json) {
    return FuelExtraModel(
      id: json['id'],
      categoryId: json['category_id'],
      name: json['name'],
      createdAt: json['created_at'],
    );
  }
}
