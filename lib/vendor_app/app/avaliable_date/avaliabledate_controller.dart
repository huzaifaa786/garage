import 'package:get/get.dart';
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
    update();
  }

  bool isSelected(DateTime day) {
    return selectedDates.contains(day);
  }

   void removeDate(DateTime day) {
    selectedDates.remove(day);
    update();
  }
}
