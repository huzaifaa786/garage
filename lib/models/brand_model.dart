class BrandModel {
  int id;
  int? categoryid;
  int? vehicletypeid;
  String? name;
  String? price;
  String? description;
  String? createdat;

  BrandModel({
    required this.id,
    this.vehicletypeid,
    this.categoryid,
    this.createdat,
    this.name,
    this.description,
    this.price,
  });
  factory BrandModel.from(Map<String, dynamic> json) {
    return BrandModel(
      id: json['id'],
      categoryid: json['category_id'] ?? 0,
      vehicletypeid: json['vehicletype_id'] ?? 0,
      price: json['price'],
      description: json['description'],
      name: json['name'],
      createdat: json['created_at'],
    );
  }
}
