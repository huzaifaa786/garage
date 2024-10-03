class RoadAssistanceExtraModel {
  int? id;
  int? categoryId;
  String? name;
  String? description;
  String? price;
  String? time;
  String? createdAt;

  RoadAssistanceExtraModel(
      {this.id,
      this.categoryId,
      this.name,
      this.description,
      this.price,
      this.createdAt,
      this.time});

  factory RoadAssistanceExtraModel.from(Map<String, dynamic> json) {
    return RoadAssistanceExtraModel(
      id: json['id'] ?? 0,
      categoryId: json['category_extra_id'] ?? 0,
      name: json['category_extra']['name'] ?? '',
      time: json['time'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? '',
      createdAt: json['created_at'] ?? '',
    );
  }
}
