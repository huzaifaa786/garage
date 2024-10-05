class GarageTimingModel {
  String shiftType;
  String openTime;
  String closeTime;

  GarageTimingModel({
    required this.shiftType,
    required this.openTime,
    required this.closeTime,
  });

  factory GarageTimingModel.fromJson(Map<String, dynamic> json) {
    return GarageTimingModel(
      shiftType: json['shift_type'],
      openTime: json['open_time'],
      closeTime: json['close_time'],
    );
  }
}
