// ignore_for_file: public_member_api_docs, sort_constructors_first

class BannerModel {
  int id;
  int garageid;
  // int bannerpriceid;
  String image;

  // String message;
  // String arname;

  BannerModel({
    required this.id,
    required this.garageid,
    // required this.bannerpriceid,
    required this.image,

    // required this.message,
    // required this.arname,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      garageid: json['garage_id'],
      // bannerpriceid: json['banner_price_id'],
      image: json['image'],

      // message: json['message'] ?? '',
      // arname: json['ar_message'] ?? '',
    );
  }
}
