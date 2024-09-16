
class TyreSizeModel {
  int id;
  int categoryId;
  String? size;
  String? createdAt;

  TyreSizeModel({
    required this.id,
    required this.categoryId,
    this.size,
    this.createdAt,
  });

  factory TyreSizeModel.from(Map<String, dynamic> json) {
    return TyreSizeModel(
      id: json['id'],
      categoryId: json['category_id'],
      size: json['size'],
      createdAt: json['created_at'],
    );
  }
}
