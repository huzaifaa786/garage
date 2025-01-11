
class BatteryVoltageModel {
  int id;
  int categoryId;
  String? voltage;
  String? ar_voltage;

  String? createdAt;

  BatteryVoltageModel({
    required this.id,
    required this.categoryId,
    this.voltage,
    this.createdAt,
    this.ar_voltage
  });

  factory BatteryVoltageModel.from(Map<String, dynamic> json) {
    return BatteryVoltageModel(
      id: json['id'],
      categoryId: json['category_id'],
      voltage: json['voltage'],
      ar_voltage: json['ar_voltage'],
      createdAt: json['created_at'],
    );
  }
}
