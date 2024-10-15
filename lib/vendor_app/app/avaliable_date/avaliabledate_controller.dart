import 'dart:developer';

import 'package:get/get.dart';
import 'package:mobilegarage/apis/vender_apis/available_date_apis/unavailable_date_api.dart';
import 'package:mobilegarage/apis/vender_apis/available_date_apis/update_unavaliable_dates_api.dart';
import 'package:table_calendar/table_calendar.dart';

class AvaliableDateController extends GetxController {
  static AvaliableDateController instance = Get.find();

  DateTime focusedDay = DateTime.now();
  List<DateTime> selectedDates = [];

  CalendarFormat format = CalendarFormat.month;

  void onFormatChanged(CalendarFormat format) {
    this.format = format;
    update();
  }

  void onDaySelected(DateTime day, DateTime focusedDay) {
    if (selectedDates.contains(day)) {
      selectedDates.remove(day);
    } else {
      selectedDates.add(day);
    }
    this.focusedDay = focusedDay;
    print(selectedDates);
    isButtonClicked = false;

    update();
  }

  bool isSelected(DateTime day) {
    return selectedDates.contains(day);
  }

  void removeDate(DateTime day) {
    selectedDates.remove(day);
    update();
  }

  var isButtonClicked = false;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    isButtonClicked = false;
    // await updateUnavaliableDates();
    update();
  }

  onconfirm() async {
    var response =
        await VUnvailableDateApi.storeUnavailableDates(selectedDates);
    if (response.isNotEmpty) {
      selectedDates.clear();
      isButtonClicked = true;
      update();
    }
  }

  // updateUnavaliableDates() async {
  //   var response = await GetUnavaliableDatesApi.getUnavaliableDates();
  //   if (response.isNotEmpty) {}

  // if (response['promotions'] != null) {
  //   getPromotions = List<Map<String, dynamic>>.from(response['promotions']);
  //   update();
  // }
  // }
}
