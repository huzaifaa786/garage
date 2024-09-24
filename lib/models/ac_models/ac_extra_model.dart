class AcExtraModel {
  int? id;
  int? categoryId;
  String? name;
  String? description;

  String? createdAt;

  AcExtraModel({
    this.id,
    this.categoryId,
    this.name,
    this.description,
    this.createdAt,
  });

  factory AcExtraModel.from(Map<String, dynamic> json) {
    return AcExtraModel(
      id: json['id'] ?? 0,
      categoryId: json['category_id'] ?? 0,
      name: json['name'] ?? '',
      createdAt: json['created_at'] ?? '',
    );
  }
}
