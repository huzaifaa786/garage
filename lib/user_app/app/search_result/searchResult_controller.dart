import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SearchResultController extends GetxController {
  static SearchResultController instance = Get.find();

  var selectedService = 'quickService';

  TimeOfDay selectedTimeFrom =
      TimeOfDay(hour: 9, minute: 0); // Default time for 'Set time'
  bool isAm = true;

  void onServiceSelected(String service) {
    selectedService = service;
    update();
  }

  void updateSelectedTime(TimeOfDay time, bool isAmPeriod) {
    selectedTimeFrom = time;
    isAm = isAmPeriod;
    update();
  }

  Position? currentPosition;
  double? lat;
  double? lng;
  String currentAddress = '';

  DateTime? selectedDate =DateTime.now();
  String? formatteddate;
  void selectDate(DateTime date) {
    selectedDate = date;
    formatteddate = DateFormat('yyyy-MM-dd').format(selectedDate!);
    update();
    print(formatteddate);
  }

  String get formattedDateTime {
    final hour = selectedTimeFrom.hour;
    final minute = selectedTimeFrom.minute;
    final period = isAm ? 'AM' : 'PM';

    return '${formatteddate}'+'   '+'${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $period';
  }
}
