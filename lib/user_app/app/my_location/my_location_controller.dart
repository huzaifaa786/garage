import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobilegarage/user_app/components/textfields/main_input_dropdown.dart';

class MyLocationController extends GetxController {
  static MyLocationController inatance = Get.find();
  TextEditingController emirateController = TextEditingController();
  TextEditingController adreesdetailController = TextEditingController();
  final List<DropdownItem> city = [
    DropdownItem(
      title: 'Dubai',
    ),
    DropdownItem(
      title: 'Abu Dhabi',
    ),
    DropdownItem(
      title: 'Fujairah',
    ),
    DropdownItem(
      title: 'Ras Al Khaimah',
    ),
    DropdownItem(
      title: 'Sharjah',
    ),
    DropdownItem(
      title: 'Umm Al Quwain',
    ),
    DropdownItem(
      title: 'Ajman',
    ),
    DropdownItem(
      title: 'Western Region',
    ),
  ];
///////////////
  Position? currentPosition;
  GetStorage box = GetStorage();
  double? lat;
  double? lng;
  String currentAddress = '';
  //
  //
  //
  //
  //
  //
  //
  //
}
