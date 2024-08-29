class EmirateModel {
  int id;
  String? name;
  String? arname;
  String? createdat;

  EmirateModel({required this.id, this.arname, this.createdat, this.name});
  factory EmirateModel.from(Map<String, dynamic> json) {
    return EmirateModel(
      id: json['id'],
      name: json['name'],
      arname: json['ar_name']??'',
      createdat: json['created_at'],
    );
  }
}
