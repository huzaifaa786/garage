import 'package:mobilegarage/models/battery_models/ampere_model.dart';
import 'package:mobilegarage/models/battery_models/origin_model.dart';
import 'package:mobilegarage/models/battery_models/product_type_model.dart';
import 'package:mobilegarage/models/battery_models/voltage_model.dart';
import 'package:mobilegarage/models/brand_model.dart';
import 'package:mobilegarage/models/category_model.dart';
import 'package:mobilegarage/models/product_attachment.dart';
import 'package:mobilegarage/models/product_image.dart';
import 'package:mobilegarage/models/tyre_models/height_model.dart';
import 'package:mobilegarage/models/tyre_models/origin_model.dart';
import 'package:mobilegarage/models/tyre_models/pattern_model.dart';
import 'package:mobilegarage/models/tyre_models/size_model.dart';
import 'package:mobilegarage/models/tyre_models/speed_rating_model.dart';
import 'package:mobilegarage/models/tyre_models/width_model.dart';

class ProductModel {
  int id;
  String? brandId;
  String? garageId;
  String? categoryId;
  String? producttypeId;
  String? originId;
  String? ampereId;
  String? voltageId;
  String? tyrewidthId;
  String? tyreheightId;
  String? tyresizeId;
  String? tyrespeedId;
  String? tyrepatterenId;
  String? tyreoriginId;
  String? oilproducttypeId;
  String? oilvolumeId;
  String? description;
  String? price;
  String? createdat;
  String? updatedat;
  String? serviceMinute;

  List<ProductImage>? images;

  List<ProductAttachment>? productAttachment;

  BrandModel? brands;
  CategoryModel? category;
  BatteryProductTypeModel? batteryProductType;
  BatteryAmpereModel? batteryAmpere;
  BatteryOriginModel? batteryOrigin;
  BatteryVoltageModel? batteryVoltage;
//
  TyreHeightModel? tyreHeight;
  TyreWidthModel? tyreWidth;
  TyreOriginModel? tyreOrigin;
  TyrePatternModel? tyrePatterns;
  TyreSizeModel? tyreSize;
  TyreSpeedRatingModel? tyreSpeed;
//

  ProductModel({
    required this.id,
    this.brands,
    this.brandId,
    this.garageId,
    this.categoryId,
    this.serviceMinute,
    this.images,
    this.productAttachment,
    //////////////////////
    this.ampereId,
    this.voltageId,
    this.batteryAmpere,
    this.batteryOrigin,
    this.batteryProductType,
    this.batteryVoltage,
    this.createdat,
    this.description,
    this.oilproducttypeId,
    this.oilvolumeId,
    this.originId,
    this.price,
    this.producttypeId,
    this.tyreHeight,
    this.tyreOrigin,
    this.tyrePatterns,
    this.tyreSize,
    this.tyreSpeed,
    this.tyreWidth,
    this.tyreheightId,
    this.tyreoriginId,
    this.tyrepatterenId,
    this.tyresizeId,
    this.tyrespeedId,
    this.tyrewidthId,
    this.updatedat,
    this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      brands: json['brands'] != null ? BrandModel.from(json['brands']) : null,
      brandId: json['brand_id'].toString(),
      garageId: json['garage_id'].toString(),
      categoryId: json['category_id'].toString(),
      serviceMinute: json['service_minute'] ?? '',
      images: json['images'] != null
          ? (json['images'] as List)
              .map((item) => ProductImage.fromJson(item))
              .toList()
          : null,
      productAttachment: json['product_attachment'] != null
          ? (json['product_attachment'] as List)
              .map((item) => ProductAttachment.fromJson(item))
              .toList()
          : null,
      ampereId: json['ampere_id'].toString(),
      originId: json['origin_id'].toString(),
      producttypeId: json['producttype_id'].toString(),
      voltageId: json['voltage_id'].toString(),
      tyreheightId: json['tyer_height_id'].toString(),
      tyrewidthId: json['tyer_width_id'].toString(),
      tyresizeId: json['tyer_size_id'].toString(),
      tyrespeedId: json['tyer_speed_rating_id'].toString(),
      tyrepatterenId: json['tyer_pattren_id'].toString(),
      tyreoriginId: json['tyer_origin_id'].toString(),
      oilproducttypeId: json['oil_product_type_id'].toString(),
      oilvolumeId: json['oil_volume_id'].toString(),
      description: json['description'].toString(),
      price: json['price'].toString(),
      createdat: json['created_at'].toString(),
      updatedat: json['updated_at'].toString(),
      batteryAmpere: json['battery_ampere'] != null
          ? BatteryAmpereModel.from(json['battery_ampere'])
          : null,
      batteryProductType: json['battery_product_type'] != null
          ? BatteryProductTypeModel.from(json['battery_product_type'])
          : null,
      batteryOrigin: json['battery_origin'] != null
          ? BatteryOriginModel.from(json['battery_origin'])
          : null,
      batteryVoltage: json['battery_voltage'] != null
          ? BatteryVoltageModel.from(json['battery_voltage'])
          : null,
      tyreWidth: json['tyer_width'] != null
          ? TyreWidthModel.from(json['tyer_width'])
          : null,
      tyreHeight: json['tyer_height'] != null
          ? TyreHeightModel.from(json['tyer_height'])
          : null,
      tyreOrigin: json['tyer_origin'] != null
          ? TyreOriginModel.from(json['tyer_origin'])
          : null,
      tyreSize: json['tyer_size'] != null
          ? TyreSizeModel.from(json['tyer_size'])
          : null,
      tyreSpeed: json['tyer_speed_rating'] != null
          ? TyreSpeedRatingModel.from(json['tyer_speed_rating'])
          : null,
      tyrePatterns: json['tyer_pattren'] != null
          ? TyrePatternModel.from(json['tyer_pattren'])
          : null,
      category: json['category'] != null
          ? CategoryModel.fromJson(json['category'])
          : null,
    );
  }
}

///////
///
class ProductExtra {
  int? id;
  String? productId;
  String? categoryExtraId;
  String? description;
  String? time;
  String? price;
  String? createdat;

  ProductExtra({
    this.id,
    this.productId,
    this.categoryExtraId,
    this.description,
    this.time,
    this.price,
    this.createdat,
  });

  factory ProductExtra.fromJson(Map<String, dynamic> json) {
    return ProductExtra(
      id: json['id'],
      productId: json['product_id'],
      categoryExtraId: json['category_extra_id'],
      description: json['description'],
      time: json['time'],
      price: json['price'],
      createdat: json['created_at'],
    );
  }
}
