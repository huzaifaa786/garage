import 'dart:convert';

class BrandNameModel {
  int id;
  int? vechilebrandid;
  String? name;
  String? createdat;

  BrandNameModel(
      {required this.id, this.vechilebrandid, this.createdat, this.name});
  factory BrandNameModel.from(Map<String, dynamic> json) {
    return BrandNameModel(
      id: json['id'],
      vechilebrandid: json['vehiclebrand_id'],
      name: json['name'],
      createdat: json['created_at'],
    );
  }
}
