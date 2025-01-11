class BatteryOriginModel {
  int id;
  int categoryId;
  String? origin;
  String? ar_origin;

  String? createdAt;

  BatteryOriginModel({
    required this.id,
    required this.categoryId,
    this.origin,
    this.ar_origin,
    this.createdAt,
  });

  factory BatteryOriginModel.from(Map<String, dynamic> json) {
    return BatteryOriginModel(
      id: json['id'],
      categoryId: json['category_id'],
      origin: json['origin'],
      ar_origin: json['ar_origin'],
      createdAt: json['created_at'],
    );
  }
}
