class ServicesModel {
  int id;
  String image;
  String name;
  String ar_name;
  String? subText; // Add subText field, nullable if optional

  ServicesModel({
    required this.id,
    required this.image,
    required this.name,
    required this.ar_name,
    this.subText, // Optional field
  });

  factory ServicesModel.fromJson(Map<String, dynamic> json) {
    return ServicesModel(
      id: json['id'],
      image: json['image'],
      name: json['name'],
      ar_name: json['ar_name'],
      subText: json['subText'],
    );
  }
}
