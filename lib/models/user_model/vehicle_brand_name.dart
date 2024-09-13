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
      vehicletype_id:json ['vehicletype_id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

