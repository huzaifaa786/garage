
class TyreSizeModel {
  int id;
  int categoryId;
  String? size;
  String? ar_size;
  String? createdAt;

  TyreSizeModel({
    required this.id,
    required this.categoryId,
    this.size,
    this.createdAt,
    this.ar_size
  });

  factory TyreSizeModel.from(Map<String, dynamic> json) {
    return TyreSizeModel(
      id: json['id'],
      categoryId: json['category_id'],
      size: json['size'],
      ar_size: json['ar_size'],
      createdAt: json['created_at'],
    );
  }
}
