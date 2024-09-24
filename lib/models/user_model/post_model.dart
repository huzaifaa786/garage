class PostModel {
  int? id;
  String? banner;
  String? logo;
  String? ownerName;
  String? name;
  String? lat;
  String? lng;
  String? createdAt;
  String? updatedAt;

  PostModel({
    this.id,
    this.banner,
    this.logo,
    this.ownerName,
    this.name,
    this.lat,
    this.lng,
    this.createdAt,
    this.updatedAt,
  });


    factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      banner: json['banner'],
      logo: json['logo'],

      ownerName: json['owner_name'] ?? '',
      name: json['name'] ?? '',
      lat: json['lat'],
      lng: json['lng'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at']
      // email: json['email'],
      // login_type: json['login_type'],
      // account_type: json['login_type'],
      // api_token: json['token'],
      // phone: json['phone'] ?? '',
      // img: json['image'] ?? '',

    );
  }
}
