class RoadAssistanceExtraModel {
  int id;
  int categoryId;
  String? name;
  String? description;
  String? price;
  String? time;
  String? createdAt;

  RoadAssistanceExtraModel(
      {required this.id,
      required this.categoryId,
      this.name,
      this.description,
      this.price,
      this.createdAt,
      this.time});

  factory RoadAssistanceExtraModel.from(Map<String, dynamic> json) {
    return RoadAssistanceExtraModel(
      id: json['id'],
      categoryId: json['category_id'],
      name: json['name'],
      createdAt: json['created_at'],
    );
  }
}
