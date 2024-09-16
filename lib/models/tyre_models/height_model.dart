
class TyreHeightModel {
  int id;
  int categoryId;
  String? height;
  String? createdAt;

  TyreHeightModel({
    required this.id,
    required this.categoryId,
    this.height,
    this.createdAt,
  });

  factory TyreHeightModel.from(Map<String, dynamic> json) {
    return TyreHeightModel(
      id: json['id'],
      categoryId: json['category_id'],
      height: json['height'],
      createdAt: json['created_at'],
    );
  }
}
