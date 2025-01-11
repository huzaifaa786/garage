
class BatteryAmpereModel {
  int id;
  int categoryId;
  String? ampere;
  String? ar_ampere;
  String? createdAt;

  BatteryAmpereModel({
    required this.id,
    required this.categoryId,
    this.ampere,
    this.createdAt,
    this.ar_ampere
  });

  factory BatteryAmpereModel.from(Map<String, dynamic> json) {
    return BatteryAmpereModel(
      id: json['id'],
      categoryId: json['category_id'],
      ampere: json['ampere'],
      ar_ampere: json['ar_ampere'],
      createdAt: json['created_at'],
    );
  }
}
