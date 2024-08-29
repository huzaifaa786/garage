class CategoryModel {
  int id;
  String? name;
  String? createdat;

  CategoryModel({required this.id,  this.createdat, this.name});
  factory CategoryModel.from(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      createdat: json['created_at'],
    );
  }
}
