class RecoveryExtraModel {
  int id;
  int categoryId;
  String? name;
  String? description;
  String? price;
  String? time;
  String? createdAt;

  RecoveryExtraModel(
      {required this.id,
      required this.categoryId,
      this.name,
      this.description,
      this.price,
      this.createdAt,
      this.time});

  factory RecoveryExtraModel.from(Map<String, dynamic> json) {
    return RecoveryExtraModel(
      id: json['id'],
      categoryId: json['category_id'],
      name: json['name'],
      createdAt: json['created_at'],
    );
  }
}
