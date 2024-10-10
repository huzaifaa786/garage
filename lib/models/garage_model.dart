import 'package:mobilegarage/models/garage_timing_model/garage_timing_model.dart';
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
  bool? opened;
  String? status;
  String? servicecount;
  List<GarageTimeModel>? garageTime;
  DateTime? createdAt;
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
      this.opened,
      this.status,
      this.garageTime,
      this.createdAt,
      this.servicecount,
      this.products});

  factory GarageModel.fromJson(Map<String, dynamic> json) {
    return GarageModel(
      id: json['id'],
      banner: json['banner'],
      logo: json['logo'],
      ownerName: json['owner_name'],
      name: json['name']??'d',
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
      status: json['status'],
      servicecount: json['totalCategoryCount'].toString(),
      garageTime: json['garage_time'] != null
          ? List<GarageTimeModel>.from(
              json['garage_time'].map((x) => GarageTimeModel.fromJson(x)),
            )
          : null,
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
