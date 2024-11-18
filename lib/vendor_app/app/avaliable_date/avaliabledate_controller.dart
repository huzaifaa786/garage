import 'package:get/get.dart';
import 'package:mobilegarage/apis/vender_apis/available_date_apis/get_unavailable_dates_api.dart';
import 'package:mobilegarage/apis/vender_apis/available_date_apis/unavailable_date_api.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class AvaliableDateController extends GetxController {
  static AvaliableDateController instance = Get.find();

  DateTime focusedDay = DateTime.now();
  List<DateTime> selectedDates = [];

  CalendarFormat format = CalendarFormat.month;

  void onFormatChanged(CalendarFormat format) {
    this.format = format;
    update();
  }

  void onDaySelected(DateTime day, DateTime focusedDay) async {
    print('object');
    if (selectedDates.contains(day)) {
      selectedDates.remove(day);
    } else {
      selectedDates.add(day);
    }
    this.focusedDay = focusedDay;
    print(selectedDates);
    isButtonClicked = false;
    await onconfirm();

    update();
  }

  bool isSelected(DateTime day) {
    return selectedDates.contains(day);
  }

  void removeDate(DateTime day) async {
    selectedDates.remove(day);
    await onconfirm();
    update();
  }

  var isButtonClicked = false;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    isButtonClicked = false;
    await getUnavailableDates();
    update();
  }

  onconfirm() async {
    var response =
        await VUnvailableDateApi.storeUnavailableDates(selectedDates);
    if (response.isNotEmpty) {
      isButtonClicked = true;
      update();
    }
  }

  getUnavailableDates() async {
    var response = await GetUnavailableDatesApi.getUnAvailableDates();

    if (response.isNotEmpty && response['unavailableDates'] != null) {
      List<String> unavailableDates =
          List<String>.from(response['unavailableDates']);

      selectedDates = unavailableDates.map((dateStr) {
        return DateFormat('yyyy-MM-dd').parse(dateStr);
      }).toList();

      update();
    }
  }
}
