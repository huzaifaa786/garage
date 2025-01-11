
class TyreHeightModel {
  int id;
  int categoryId;
  String? height;
  String? ar_height;
  String? createdAt;

  TyreHeightModel({
    required this.id,
    required this.categoryId,
    this.height,
    this.createdAt,
    this.ar_height
  });

  factory TyreHeightModel.from(Map<String, dynamic> json) {
    return TyreHeightModel(
      id: json['id'],
      categoryId: json['category_id'],
      height: json['height'],
      ar_height: json['ar_height'],
      createdAt: json['created_at'],
    );
  }
}
