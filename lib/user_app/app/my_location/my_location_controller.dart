import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyLocationController extends GetxController {
  static MyLocationController inatance = Get.find();
  TextEditingController emirateController = TextEditingController();
  TextEditingController adreesdetailController = TextEditingController();
    List<String> citiesList = [
    'Dubai',
    'Abu Dhabi',
    'Fujairah',
    'Ras Al Khaimah',
    'Sharjah',
    'Umm Al Quwain',
    'Ajman',
    'Western Region',
  ];
///////////////
  Position? currentPosition;
  GetStorage box = GetStorage();
  double? lat;
  double? lng;
  String currentAddress = '';

}
