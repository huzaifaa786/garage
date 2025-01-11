
class TyreWidthModel {
  int id;
  int categoryId;
  String? width;
  String? ar_width;
  String? createdAt;

  TyreWidthModel({
    required this.id,
    required this.categoryId,
    this.width,
    this.createdAt,
    this.ar_width
  });

  factory TyreWidthModel.from(Map<String, dynamic> json) {
    return TyreWidthModel(
      id: json['id'],
      categoryId: json['category_id'],
      width: json['width'],
      ar_width: json['ar_width'],
      createdAt: json['created_at'],
    );
  }
}
