class AcExtraModel {
  int id;
  int categoryId;
  String? name;
  String? description;

  String? createdAt;

  AcExtraModel({
    required this.id,
    required this.categoryId,
    this.name,
    this.description,
    this.createdAt,
  });

  factory AcExtraModel.from(Map<String, dynamic> json) {
    return AcExtraModel(
      id: json['id'],
      categoryId: json['category_id'],
      name: json['name'],
      createdAt: json['created_at'],
    );
  }
}
