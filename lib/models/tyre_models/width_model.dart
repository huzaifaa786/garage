
class TyreWidthModel {
  int id;
  int categoryId;
  String? width;
  String? createdAt;

  TyreWidthModel({
    required this.id,
    required this.categoryId,
    this.width,
    this.createdAt,
  });

  factory TyreWidthModel.from(Map<String, dynamic> json) {
    return TyreWidthModel(
      id: json['id'],
      categoryId: json['category_id'],
      width: json['width'],
      createdAt: json['created_at'],
    );
  }
}
