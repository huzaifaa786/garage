
class TyreSpeedRatingModel {
  int id;
  int categoryId;
  String? speedrating;
  String? createdAt;

  TyreSpeedRatingModel({
    required this.id,
    required this.categoryId,
    this.speedrating,
    this.createdAt,
  });

  factory TyreSpeedRatingModel.from(Map<String, dynamic> json) {
    return TyreSpeedRatingModel(
      id: json['id'],
      categoryId: json['category_id'],
      speedrating: json['speed_rating'],
      createdAt: json['created_at'],
    );
  }
}
