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
  String? createdAtRelative;
  String? updatedAtRelative;
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
    this.createdAtRelative,
    this.updatedAtRelative,
  });

  factory GarageReviewsModel.fromJson(Map<String, dynamic> json) {
    DateTime createdDate = DateTime.parse(json['created_at']);
    DateTime updatedDate = DateTime.parse(json['updated_at']);

    return GarageReviewsModel(
      id: json['id'].toString(),
      userId: json['user_id'].toString(),
      garageId: json['garage_id'].toString(),
      orderId: json['order_id'].toString(),
      rating: json['rating'],
      comment: json['comment'],
      createdAt: createdDate,
      updatedAt: updatedDate,
      user: UserModel.fromJson(json['user']),
      createdAtRelative: _getRelativeTime(createdDate),
      updatedAtRelative: _getRelativeTime(updatedDate),
    );
  }
  static String _getRelativeTime(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays > 1) {
      return "${difference.inDays} days ago";
    } else if (difference.inDays == 1) {
      return "1 day ago";
    } else if (difference.inHours > 1) {
      return "${difference.inHours} hours ago";
    } else if (difference.inHours == 1) {
      return "1 hour ago";
    } else if (difference.inMinutes > 1) {
      return "${difference.inMinutes} minutes ago";
    } else if (difference.inMinutes == 1) {
      return "1 minute ago";
    } else {
      return "Just now";
    }
  }
}
