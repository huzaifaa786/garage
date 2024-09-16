
class BatteryOriginModel {
  int id;
  int categoryId;
  String? origin;
  String? createdAt;

  BatteryOriginModel({
    required this.id,
    required this.categoryId,
    this.origin,
    this.createdAt,
  });

  factory BatteryOriginModel.from(Map<String, dynamic> json) {
    return BatteryOriginModel(
      id: json['id'],
      categoryId: json['category_id'],
      origin: json['origin'],
      createdAt: json['created_at'],
    );
  }
}
