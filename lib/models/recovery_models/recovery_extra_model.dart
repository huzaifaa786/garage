class RecoveryExtraModel {
  int? id;
  int ?categoryId;
  String? name;
  String? description;
  String? price;
  String? time;
  String? createdAt;

  RecoveryExtraModel(
      { this.id,
       this.categoryId,
      this.name,
      this.description,
      this.price,
      this.createdAt,
      this.time});

  factory RecoveryExtraModel.from(Map<String, dynamic> json) {
    return RecoveryExtraModel(
      id: json['id']??0,
      categoryId: json['category_id']??0,
      name: json['name']??'',
      createdAt: json['created_at']??'',
    );
  }
}
