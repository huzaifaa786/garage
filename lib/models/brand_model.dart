class BrandModel {
  int id;
  int? categoryid;
  int? vehicletypeid;
 final String name;
  String? price;
  String? image;
  String? description;
  String? status;

  BrandModel({
    required this.id,
    this.vehicletypeid,
    this.categoryid,
  required  this.name,
    this.image,
    this.description,
    this.price,
    this.status,
  });
  factory BrandModel.from(Map<String, dynamic> json) {
    return BrandModel(
      id: json['id'],
      categoryid: json['category_id'] ?? 0,
      vehicletypeid: json['vehicletype_id'] ?? 0,
      price: json['price'] ?? '',
      description: json['description'] ?? '',
      image: json['image'],
      name: json['name'] ?? '',
      status: json['status'] ?? '',
    );
  }
}
