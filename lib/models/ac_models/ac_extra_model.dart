class AcExtraModel {
  int? id;
  int? categoryId;
  String? name;
  String? description;
  String? price;
  String? arname;
  String? createdAt;

  AcExtraModel(
      {this.id,
      this.categoryId,
      this.name,
      this.description,
      this.createdAt,
      this.price,
      this.arname
      });

  factory AcExtraModel.from(Map<String, dynamic> json) {
    return AcExtraModel(
      id: json['id'] ?? 0,
      categoryId: json['category_extra_id'] ?? 0,
      // name: json['category_extra']['name'] ?? '',
      name:  json['category_extra'] != null? json['category_extra']['name'] : json['name']??'',
      arname:  json['category_extra'] != null? json['category_extra']['ar_name'] : json['ar_name']??'',
      description: json['description'] ?? '',
      price: json['price'] ?? '',
      createdAt: json['created_at'] ?? '',
    );
  }
}
