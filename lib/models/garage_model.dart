import 'package:mobilegarage/models/product_model.dart';

class GarageModel {
  int? id;
  String? banner;
  String? logo;
  String? ownerName;
  String? name;
  String? email;
  String? idFront;
  String? idBack;
  String? license;
  String? description;
  String? phone;
  String? lat;
  String? lng;
  int? emirateId;
  String? address;
  DateTime? createdAt;
  bool? opened;
  List<ProductModel>? products = [];

  GarageModel(
      {this.id,
      this.banner,
      this.logo,
      this.ownerName,
      this.name,
      this.email,
      this.idFront,
      this.idBack,
      this.license,
      this.description,
      this.phone,
      this.lat,
      this.lng,
      this.emirateId,
      this.address,
      this.createdAt,
      this.opened,this.products});

  factory GarageModel.fromJson(Map<String, dynamic> json) {
    return GarageModel(
      id: json['id'],
      banner: json['banner'],
      logo: json['logo'],
      ownerName: json['owner_name'],
      name: json['name'],
      email: json['email'],
      idFront: json['id_front'],
      idBack: json['id_back'],
      license: json['license'],
      description: json['description'],
      phone: json['phone'],
      lat: json['lat'],
      lng: json['lng'],
      emirateId: json['emirate_id'],
      address: json['address'],
      opened: json['opened'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
          products: json['products'] != null
          ? (json['products'] as List)
              .map((item) => ProductModel.fromJson(item))
              .toList()
          : null,
    );
  }
}
