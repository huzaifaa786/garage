class VehicleModel {
  int id;
  String? name;
  String? arName;
  String? icon;
  String? createdat;

  VehicleModel({
    required this.id,
    this.createdat,
    this.name,
    this.arName,
    this.icon,
  });
  factory VehicleModel.from(Map<String, dynamic> json) {
    return VehicleModel(
      id: json['id'],
      icon: json['icon'],
      name: json['name'],
      arName: json['ar_name'],
      createdat: json['created_at'],
    );
  }
}
