class BannerModel {
  int id;
  String? duration;
  String? cost;
  String? createdat;

  BannerModel({required this.id, this.cost, this.createdat, this.duration});
  factory BannerModel.from(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      duration: json['duration'],
      cost: json['cost'],
      createdat: json['created_at'],
    );
  }
}