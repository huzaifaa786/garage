
class BatteryAmpereModel {
  int id;
  int categoryId;
  String? ampere;
  String? createdAt;

  BatteryAmpereModel({
    required this.id,
    required this.categoryId,
    this.ampere,
    this.createdAt,
  });

  factory BatteryAmpereModel.from(Map<String, dynamic> json) {
    return BatteryAmpereModel(
      id: json['id'],
      categoryId: json['category_id'],
      ampere: json['ampere'],
      createdAt: json['created_at'],
    );
  }
}
