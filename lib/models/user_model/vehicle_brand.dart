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