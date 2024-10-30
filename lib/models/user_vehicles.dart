// ignore_for_file: non_constant_identifier_names, prefer_null_aware_operators

class UserVehicles {
  String id;
  String? userId;
  String? vehicletype_id;
  vehicleType? vehicle_type;
  //   vehiclebrandname? vehiclebrandname_id;
  String? vehiclebrand_id;
  String? vehiclebrandname_id;
  String? year_of_manufacture;
  String? vehicle_info;
  String? image;
  vehicleBrand? vehiclebrand;
  vehicleBrandName? vehiclebrandname;
  String? createdAt;
  String? updatedAt;

  UserVehicles({
    required this.id,
    this.userId,
    this.vehicletype_id,
    this.vehiclebrand_id,
    this.vehiclebrandname_id,
    this.year_of_manufacture,
    this.vehicle_info,
    this.image,
    this.vehiclebrand,
    this.vehiclebrandname,
    this.createdAt,
    this.updatedAt,
    this.vehicle_type,
  });

  factory UserVehicles.fromJson(Map<String, dynamic> json) {
    return UserVehicles(
      id: json['id'].toString(),
      userId: json['userId'].toString(),
      vehicletype_id: json['vehicletype_id'].toString(),
      vehiclebrandname_id: json['vehiclebrandname_id'] != null
          ? json['vehiclebrandname_id'].toString()
          : null,
      vehicle_type: vehicleType.fromJson(json['vehicle_type']),
      vehiclebrand_id: json['vehiclebrand_id'] != null
          ? json['vehiclebrand_id'].toString()
          : null,
      year_of_manufacture: json['year_of_manufacture'].toString(),
      vehicle_info: json['vehicle_info'],
      image: json['image'],
      vehiclebrand: vehicleBrand.fromJson(json['vehicle_brand']),
      vehiclebrandname: vehicleBrandName.fromJson(json['vehicle_brand_name']),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

class vehicleType {
  final int id;
  final String icon;
  final String? name;
  final String? createdAt;

  vehicleType({
    required this.id,
    required this.name,
    required this.icon,
    this.createdAt,
  });

  factory vehicleType.fromJson(Map<String, dynamic> json) {
    return vehicleType(
      id: json['id'],
      name: json['name'],
      createdAt: json['createdAt'],
      icon: json['icon'],
    );
  }
}

class vehicleBrand {
  final int id;
  final String? name;
  final String? icon;
  final String? createdAt;
  final String? updatedAt;

  vehicleBrand({
    required this.id,
    this.name,
    this.icon,
    this.createdAt,
    this.updatedAt,
  });

  factory vehicleBrand.fromJson(Map<String, dynamic> json) {
    return vehicleBrand(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

class vehicleBrandName {
  final int id;
  final String vehicletype_id;
  final String? name;
  final String? createdAt;
  final String? updatedAt;

  vehicleBrandName({
    required this.id,
    required this.name,
    required this.vehicletype_id,
    this.createdAt,
    this.updatedAt,
  });

  factory vehicleBrandName.fromJson(Map<String, dynamic> json) {
    return vehicleBrandName(
      id: json['id'],
      name: json['name'],
      vehicletype_id: json['vehicletype_id'].toString(),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
