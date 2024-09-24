class CarWashExtraModel {
  int? id;
  int ?categoryId;
  String? name;
  String? description;
  String? price;
  String? time;
  String? createdAt;

  CarWashExtraModel(
      { this.id,
       this.categoryId,
      this.name,
      this.description,
      this.price,
      this.createdAt,
      this.time});

  factory CarWashExtraModel.from(Map<String, dynamic> json) {
    return CarWashExtraModel(
      id: json['id']??0,
      categoryId: json['category_id']??0,
      name: json['name']??'',
      createdAt: json['created_at']??'',
    );
  }
}
