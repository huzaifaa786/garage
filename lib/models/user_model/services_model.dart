class ServicesModel {
  int id;
  String image;
  String name;
  String? subText; // Add subText field, nullable if optional

  ServicesModel({
    required this.id,
    required this.image,
    required this.name,
    this.subText, // Optional field
  });

  factory ServicesModel.fromJson(Map<String, dynamic> json) {
    return ServicesModel(
      id: json['id'],
      image: json['image'],
      name: json['name'],
      subText: json['subText'], // Ensure this is correctly mapped from JSON
    );
  }
}
