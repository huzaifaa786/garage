import 'package:mobilegarage/models/user_model.dart';

class GarageReviewsModel {
  String? id;
  String? userId;
  String? garageId;
  String? orderId;
  String? rating;
  String? comment;
  DateTime? createdAt;
  DateTime? updatedAt;
  UserModel? user;
  GarageReviewsModel({
    this.id,
    this.userId,
    this.garageId,
    this.orderId,
    this.rating,
    this.comment,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  factory GarageReviewsModel.fromJson(Map<String, dynamic> json) {
    return GarageReviewsModel(
      id: json['id'].toString(),
      userId: json['user_id'].toString(),
      garageId: json['garage_id'].toString(),
      orderId: json['order_id'].toString(),
      rating: json['rating'],
      comment: json['comment'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      user: UserModel.fromJson(json['user']),
    );
  }
}
