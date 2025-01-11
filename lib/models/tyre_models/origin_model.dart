
class TyreOriginModel {
  int id;
  int categoryId;
  String? origin;
  String? ar_origin;
  String? createdAt;

  TyreOriginModel({
    required this.id,
    required this.categoryId,
    this.origin,
    this.createdAt,
    this.ar_origin
  });

  factory TyreOriginModel.from(Map<String, dynamic> json) {
    return TyreOriginModel(
      id: json['id'],
      categoryId: json['category_id'],
      origin: json['origin'],
      ar_origin: json['ar_origin'],
      createdAt: json['created_at'],
    );
  }
}
