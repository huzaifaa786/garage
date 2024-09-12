class UserModel {
  int id;
  String? name;
  String? phone;
  String? emirate;
  String? email;
  String? image;
  String? addressDetail;
  String? createdAt;
  String? lat;
  String? lng;


  UserModel({
    required this.id,
    this.name,
    this.phone,
    this.emirate,
    this.email,
    this.addressDetail,
    this.createdAt,
    this.image,
    this.lat,this.lng
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      emirate: json['emirate'],
      addressDetail: json['address'],
      createdAt: json['created_at'],
      image: json['image'],
      lat: json['lat'],
      lng: json['lng'],


    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'emirate': emirate,
      'address_detail': addressDetail,
      'created_at': createdAt,
    };
  }
}
