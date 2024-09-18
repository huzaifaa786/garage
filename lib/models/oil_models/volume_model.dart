
class OilVolumeModel {
  int id;
  int categoryId;
  String? volume;
  String? createdAt;

  OilVolumeModel({
    required this.id,
    required this.categoryId,
    this.volume,
    this.createdAt,
  });

  factory OilVolumeModel.from(Map<String, dynamic> json) {
    return OilVolumeModel(
      id: json['id'],
      categoryId: json['category_id'],
      volume: json['volume_litter'],
      createdAt: json['created_at'],
    );
  }
}
