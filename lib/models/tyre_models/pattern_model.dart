
class TyrePatternModel {
  int id;
  int categoryId;
  String? pattern;
  String? ar_pattern;
  String? createdAt;

  TyrePatternModel({
    required this.id,
    required this.categoryId,
    this.pattern,
    this.createdAt,
    this.ar_pattern
  });

  factory TyrePatternModel.from(Map<String, dynamic> json) {
    return TyrePatternModel(
      id: json['id'],
      categoryId: json['category_id'],
      pattern: json['pattren'],
      ar_pattern: json['ar_pattren'],
      createdAt: json['created_at'],
    );
  }
}
