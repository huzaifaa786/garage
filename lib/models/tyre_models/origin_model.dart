
class TyreOriginModel {
  int id;
  int categoryId;
  String? origin;
  String? createdAt;

  TyreOriginModel({
    required this.id,
    required this.categoryId,
    this.origin,
    this.createdAt,
  });

  factory TyreOriginModel.from(Map<String, dynamic> json) {
    return TyreOriginModel(
      id: json['id'],
      categoryId: json['category_id'],
      origin: json['origin'],
      createdAt: json['created_at'],
    );
  }
}
