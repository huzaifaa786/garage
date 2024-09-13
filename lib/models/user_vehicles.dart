// ignore_for_file: non_constant_identifier_names

class UserVehicles {
  final int? userId;
  final int id;
  final String? vehicletype_id;
  final vehicleBrand? vehiclebrand_id;
  final vehiclebrandname? vehiclebrandname_id;
  final int? year_of_manufacture;
  final String? vehicle_info;
  final String? image;
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
    this.createdAt,
    this.updatedAt,
  });

  factory UserVehicles.fromJson(Map<String, dynamic> json) {
    return UserVehicles(
      id: json['id'],
      userId: json['userId'] != null ? json['userId'] : null,
      vehicletype_id: json['vehicletype_id'].toString(),
      vehiclebrandname_id: json['vehiclebrandname_id'] != null
          ? vehiclebrandname.fromJson(json['vehiclebrand_id'])
          : null,
      vehiclebrand_id: json['vehiclebrand_id'] != null
          ? vehicleBrand.fromJson(json['vehiclebrand_id'])
          : null,
      year_of_manufacture: json['year_of_manufacture'],
      vehicle_info: json['vehicle_info'],
      image: json['image'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
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

class vehiclebrandname {
  final int id;
  final String vehicletype_id;
  final String? name;
  final String? createdAt;
  final String? updatedAt;

  vehiclebrandname({
    required this.id,
    required this.name,
    required this.vehicletype_id,
    this.createdAt,
    this.updatedAt,
  });

  factory vehiclebrandname.fromJson(Map<String, dynamic> json) {
    return vehiclebrandname(
      id: json['id'],
      name: json['name'],
      vehicletype_id: json['vehicletype_id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
