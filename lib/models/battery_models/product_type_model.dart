
class BatteryProductTypeModel {
  int id;
  int categoryId;
  String? name;
  String? ar_name;

  String? createdAt;

  BatteryProductTypeModel({
    required this.id,
    required this.categoryId,
    this.name,
    this.ar_name,
    this.createdAt,
  });

  factory BatteryProductTypeModel.from(Map<String, dynamic> json) {
    return BatteryProductTypeModel(
      id: json['id'],
      categoryId: json['category_id'],
      name: json['name'],
      ar_name: json['ar_name'],

      createdAt: json['created_at'],
    );
  }
}
