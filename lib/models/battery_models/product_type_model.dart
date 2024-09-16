
class BatteryProductTypeModel {
  int id;
  int categoryId;
  String? name;
  String? createdAt;

  BatteryProductTypeModel({
    required this.id,
    required this.categoryId,
    this.name,
    this.createdAt,
  });

  factory BatteryProductTypeModel.from(Map<String, dynamic> json) {
    return BatteryProductTypeModel(
      id: json['id'],
      categoryId: json['category_id'],
      name: json['name'],
      createdAt: json['created_at'],
    );
  }
}
