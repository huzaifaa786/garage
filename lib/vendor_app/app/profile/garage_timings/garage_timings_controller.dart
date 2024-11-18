import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/apis/vender_apis/garage_timings_api/garage_timings_api.dart';
import 'package:mobilegarage/apis/vender_apis/garage_timings_api/get_garage_timings_api.dart';
import 'package:mobilegarage/models/garage_timing_model/garage_timing_model.dart';
import 'package:mobilegarage/vendor_app/utils/ui_utils.dart';

class GarageTimingsController extends GetxController {
  static GarageTimingsController instance = Get.find();

  TimeOfDay selectedTimeOpenFromMorning = TimeOfDay.now();
  TimeOfDay selectedTimeCloseMorning = TimeOfDay.now();
  TimeOfDay selectedTimeOpenFromNight = TimeOfDay.now();
  TimeOfDay selectedTimeCloseNight = TimeOfDay.now();

  late List<GarageTimeModel> garageTimings;

  @override
  void onInit() async {
    super.onInit();
    _initGarageTimings();
    await getGarageTimings();
  }

  void _initGarageTimings() {
    garageTimings = [
      GarageTimeModel(
        shiftType: "morning",
        openTime: _formatTimeOfDay(selectedTimeOpenFromMorning),
        closeTime: _formatTimeOfDay(selectedTimeCloseMorning),
      ),
      GarageTimeModel(
        shiftType: "night",
        openTime: _formatTimeOfDay(selectedTimeOpenFromNight),
        closeTime: _formatTimeOfDay(selectedTimeCloseNight),
      ),
    ];
  }

  void updateGarageTimingModel(
      String shiftType, TimeOfDay openTime, TimeOfDay closeTime) {
    final index =
        garageTimings.indexWhere((timing) => timing.shiftType == shiftType);
    if (index != -1) {
      garageTimings[index] = GarageTimeModel(
        shiftType: shiftType,
        openTime: _formatTimeOfDay(openTime),
        closeTime: _formatTimeOfDay(closeTime),
      );
    }
  }

  String _formatTimeOfDay(TimeOfDay time) {
    final hours = time.hour.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, '0');
    return '$hours:$minutes';
  }

  Future<bool> postGarageTimings(List<GarageTimeModel> garageTimings) async {
    List<Map<String, dynamic>> formattedGarageTimings =
        garageTimings.map((timing) {
      return {
        "shift_type": timing.shiftType,
        "open_time": timing.openTime,
        "close_time": timing.closeTime,
      };
    }).toList();

    var response = await GarageTimingsApi.garageTimings(
      garagetimes: formattedGarageTimings,
    );

    if (response.isNotEmpty) {
      update();
      UiUtilites.successSnackbar( 'Time Added Successfully'.tr,'Success'.tr,);
      Get.back();
    }

    return response.isNotEmpty;
  }

  getGarageTimings() async {
    var response = await GetGarageTimingsApi.fetchGarageTimings();

    if (response.isNotEmpty) {
      var latestGarageTiming = response['latestGarageTimings'];

      if (latestGarageTiming != null) {
        var morningTiming = latestGarageTiming['morning'];
        var nightTiming = latestGarageTiming['night'];

        if (morningTiming != null) {
          String openTime = morningTiming['open_time'];
          String closeTime = morningTiming['close_time'];

          selectedTimeOpenFromMorning = _parseTime(openTime);
          selectedTimeCloseMorning = _parseTime(closeTime);
        }

        if (nightTiming != null) {
          String openTime = nightTiming['open_time'];
          String closeTime = nightTiming['close_time'];

          selectedTimeOpenFromNight = _parseTime(openTime);
          selectedTimeCloseNight = _parseTime(closeTime);
        }

        updateGarageTimingModel(
          "morning",
          selectedTimeOpenFromMorning,
          selectedTimeCloseMorning,
        );

        updateGarageTimingModel(
          "night",
          selectedTimeOpenFromNight,
          selectedTimeCloseNight,
        );

        update();
      }
    }
  }

  TimeOfDay _parseTime(String time) {
    var parts = time.split(':');
    var hour = int.parse(parts[0]);
    var minute = int.parse(parts[1]);
    return TimeOfDay(hour: hour, minute: minute);
  }

  onSaveChanges(Function updateUI) async {
    updateGarageTimingModel(
      "morning",
      selectedTimeOpenFromMorning,
      selectedTimeCloseMorning,
    );

    updateGarageTimingModel(
      "night",
      selectedTimeOpenFromNight,
      selectedTimeCloseNight,
    );

    bool success = await postGarageTimings(garageTimings);
    if (success) {
      updateUI();
    }
  }
}
