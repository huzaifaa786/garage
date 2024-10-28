import 'package:get/get.dart';
import 'package:mobilegarage/apis/vender_apis/sales/orders_sales_api.dart';
import 'package:table_calendar/table_calendar.dart';

class SalesController extends GetxController {
  static SalesController instance = Get.find();
  CalendarFormat format = CalendarFormat.month;
  var format1 = 'month';
  DateTime selecteddate = DateTime.now();
  DateTime today = DateTime.now();

  DateTime? rangeStart;
  DateTime? rangeEnd;

  double totalAmount = 0.0;
  int totalOrders = 0;

  @override
  void onInit() async {
    super.onInit();
    await getSalesForSingleDate(today);
  }

  void onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    rangeStart = start;
    rangeEnd = end;
    today = focusedDay;
    selecteddate = focusedDay;

    if (start != null && end != null) {
      getSales(
        start.toIso8601String().split('T').first,
        end.toIso8601String().split('T').first,
      );
    } else {
      getSalesForSingleDate(focusedDay);
    }
    update();
  }

  void onFormatChanged(DateTime date) {
    today = date;
    selecteddate = date;
    update();
  }

  Future<void> getSales(String startDate, String endDate) async {
    var response = await OrdersSalesApi.getSales(startDate, endDate);
    if (response.isNotEmpty) {
      totalAmount = (response['sales']['totalAmount'] ?? 0).toDouble();
      totalOrders = response['sales']['totalOrders'] ?? 0;
    }
    update();
  }

  Future<void> getSalesForSingleDate(DateTime date) async {
    var response = await OrdersSalesApi.getSalesForDate(
        date.toIso8601String().split('T').first);
    if (response.isNotEmpty) {
      totalAmount = (response['sales']['totalAmount'] ?? 0).toDouble();
      totalOrders = response['sales']['totalOrders'] ?? 0;
    }
    update();
  }
}
