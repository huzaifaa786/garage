class RecoveryExtraModel {
  int? id;
  int? categoryId;
  String? name;
  String? description;
  String? price;
  String? time;
  String? createdAt;

  RecoveryExtraModel(
      {this.id,
      this.categoryId,
      this.name,
      this.description,
      this.price,
      this.createdAt,
      this.time});

  factory RecoveryExtraModel.from(Map<String, dynamic> json) {
    return RecoveryExtraModel(
      id: json['id'] ?? 0,
      categoryId: json['category_extra_id'] ?? 0,
      // name: json['category_extra']['name'] ?? '',
      name:  json['category_extra'] != null? json['category_extra']['name'] : json['name']??'',

      time: json['time'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? '',
      createdAt: json['created_at'] ?? '',
    );
  }
}
