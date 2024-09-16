class ProductDetailModel {
  int id;
  String? name;
  String? image;
  String? createdat;
  //   List<BatteryProductTypeModel>? batteryProductTypes;
  // List<BatteryOriginModel>? batteryOrigins;
  // List<BatteryAmpereModel>? batteryAmperes;
  // List<BatteryVoltageModel>? batteryVoltages;

  ProductDetailModel({
    required this.id,
    this.name,
    this.image,
    this.createdat,
    //  this.batteryProductTypes,
    // this.batteryOrigins,
    // this.batteryAmperes,
    // this.batteryVoltages,
  });
  factory ProductDetailModel.from(Map<String, dynamic> json) {
    return ProductDetailModel(
      id: json['id'],
      createdat: json['created_at'],
      image: json['image'],
      name: json['name'],
      //  batteryProductTypes: json['battery_product_type'] != null
      //     ? List<BatteryProductTypeModel>.from(json['battery_product_type']
      //         .map((x) => BatteryProductTypeModel.from(x)))
      //     : [],
      // batteryOrigins: json['battery_origin'] != null
      //     ? List<BatteryOriginModel>.from(json['battery_origin']
      //         .map((x) => BatteryOriginModel.from(x)))
      //     : [],
      // batteryAmperes: json['battery_ampere'] != null
      //     ? List<BatteryAmpereModel>.from(json['battery_ampere']
      //         .map((x) => BatteryAmpereModel.from(x)))
      //     : [],
      // batteryVoltages: json['battery_voltage'] != null
      //     ? List<BatteryVoltageModel>.from(json['battery_voltage']
      //         .map((x) => BatteryVoltageModel.from(x)))
      //     : [],
    );
  }
}
