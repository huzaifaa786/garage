
class BatteryVoltageModel {
  int id;
  int categoryId;
  String? voltage;
  String? createdAt;

  BatteryVoltageModel({
    required this.id,
    required this.categoryId,
    this.voltage,
    this.createdAt,
  });

  factory BatteryVoltageModel.from(Map<String, dynamic> json) {
    return BatteryVoltageModel(
      id: json['id'],
      categoryId: json['category_id'],
      voltage: json['voltage'],
      createdAt: json['created_at'],
    );
  }
}
