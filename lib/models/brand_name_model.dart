class BrandNameModel {
  int id;
  int? vechilebrandid;
  String? name;
  String? arName;
  String? createdat;

  BrandNameModel(
      {required this.id,
      this.vechilebrandid,
      this.createdat,
      this.name,
      this.arName});
  factory BrandNameModel.from(Map<String, dynamic> json) {
    return BrandNameModel(
      id: json['id'],
      vechilebrandid: json['vehiclebrand_id'],
      name: json['name'],
      arName: json['ar_name'],
      createdat: json['created_at'],
    );
  }
}
