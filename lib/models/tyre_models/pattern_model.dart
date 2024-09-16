
class TyrePatternModel {
  int id;
  int categoryId;
  String? pattern;
  String? createdAt;

  TyrePatternModel({
    required this.id,
    required this.categoryId,
    this.pattern,
    this.createdAt,
  });

  factory TyrePatternModel.from(Map<String, dynamic> json) {
    return TyrePatternModel(
      id: json['id'],
      categoryId: json['category_id'],
      pattern: json['pattren'],
      createdAt: json['created_at'],
    );
  }
}
