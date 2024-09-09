// ignore_for_file: public_member_api_docs, sort_constructors_first

class BannerModel {
  int id;
  int garageid;
  int bannerpriceid;
  String image;
  String createdat;
  String updatedat;

  // String message;
  // String arname;

  BannerModel({
    required this.id,
    required this.garageid,
    required this.bannerpriceid,
    required this.image,
    required this.createdat,
    required this.updatedat,
    
    
    // required this.message,
    // required this.arname,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      garageid: json['garage_id'],
      bannerpriceid: json['banner_price_id'],
      image: json['image'],
      createdat: json['created_at'],
      updatedat: json['updated_at'],
      // message: json['message'] ?? '',
      // arname: json['ar_message'] ?? '',
    );
  }
}
