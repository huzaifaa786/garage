
class TyreSpeedRatingModel {
  int id;
  int categoryId;
  String? speedrating;
  String? ar_speedrating;
  String? createdAt;

  TyreSpeedRatingModel({
    required this.id,
    required this.categoryId,
    this.speedrating,
    this.createdAt,
    this.ar_speedrating
  });

  factory TyreSpeedRatingModel.from(Map<String, dynamic> json) {
    return TyreSpeedRatingModel(
      id: json['id'],
      categoryId: json['category_id'],
      speedrating: json['speed_rating'],
      ar_speedrating: json['ar_speed_rating'],
      createdAt: json['created_at'],
    );
  }
}
