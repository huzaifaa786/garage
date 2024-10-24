import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mobilegarage/apis/vender_apis/sales/orders_sales_api.dart';
import 'package:table_calendar/table_calendar.dart';

class SaleController extends GetxController {
  static SaleController instance = Get.find();
  CalendarFormat format = CalendarFormat.month;
  var format1 = 'month';
  DateTime Ourdate = DateTime.now();
  DateTime today = DateTime.now();

  DateTime? rangeStart;
  DateTime? rangeEnd;

  @override
  void onInit() async {
    super.onInit();
    await getSales();
  }

  void onRangeSelected(start, end, focusedDay) {
    rangeStart = start;
    rangeEnd = end;
    today = focusedDay;
    Ourdate = focusedDay;

    update();
  }

  void onFormatChanged(DateTime date) {
    today = date;
    Ourdate = date;
    update();
  }

  getSales() async {
    var response = await OrdersSalesApi.getSales();
    if (response.isNotEmpty) {}
    update();
  }
}
