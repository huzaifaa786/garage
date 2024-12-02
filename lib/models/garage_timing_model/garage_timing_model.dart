class GarageTimeModel {
  int? id;
  int? garageId;
  String shiftType;
  String openTime;
  String closeTime;

  GarageTimeModel({
    this.id,
    this.garageId,
    required this.shiftType,
    required this.openTime,
    required this.closeTime,
  });

  factory GarageTimeModel.fromJson(Map<String, dynamic> json) {
    return GarageTimeModel(
      id: json['id'],
      garageId: json['garage_id'],
      shiftType: json['shift_type'],
      openTime: json['open_time'],
      closeTime: json['close_time'],
    );
  }
}
