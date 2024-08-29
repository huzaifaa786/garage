class BrandModel {
  int id;
  int categoryid;
  String? name;
  String? price;
  String? description;
  String? createdat;

  BrandModel({
    required this.id,
    required this.categoryid,
    this.createdat,
    this.name,
    this.description,
    this.price,
  });
  factory BrandModel.from(Map<String, dynamic> json) {
    return BrandModel(
      id: json['id'],
      categoryid: json['category_id'],
      price: json['price'],
      description: json['description'],
      name: json['name'],
      createdat: json['created_at'],
    );
  }
}
