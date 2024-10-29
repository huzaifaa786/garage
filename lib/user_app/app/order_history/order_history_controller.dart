import 'package:get/get.dart';
import 'package:mobilegarage/apis/user_apis/order_apis/order_history_api.dart';

class OrderHistoryController extends GetxController {
  static OrderHistoryController instance = Get.find();
  getOrder() async {
    var response = await OrderHistoryApi.getOrder();
    if (response.isNotEmpty) {
      // await fetchOrders();
      print('d');
    }
  }
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getOrder();
  }
  List<Map<String, dynamic>> orders = [
    {
      "productImage": "https://dummyimage.com/93x93/000/fff",
      "clientImage": "https://dummyimage.com/20x20/000/fff",
      "client Name": "Street garage",
      "product": "Car super power battery",
      "product_Detail": "",
      "carName": "white Mercedes 2022",
      "date": "2/3/230",
      "time": "2:30",
      "Price": "230",
      "item": "2",
      "product_type": "xx4",
      "quantity": "4",
      'TrackingNumber': "356729100",
    },
    {
      "productImage": "https://dummyimage.com/93x93/000/fff",
      "clientImage": "https://dummyimage.com/20x20/000/fff",
      "client Name": "Street garage",
      "product": "Car washing",
      "product_type": "self-service car wash",
      "carName": "white Mercedes 2022",
      "date": "2/3/230",
      "time": "2:30",
      "Price": "230",
      "product_Detail": "7",
      "item": "5",
      "quantity": "",
      'TrackingNumber': "356729100",
    },
    {
      "productImage": "https://dummyimage.com/93x93/000/fff",
      "clientImage": "https://dummyimage.com/20x20/000/fff",
      "client Name": "Street garage",
      "product": "Car battery oil",
      "product_Detail": "",
      "carName": "white Mercedes 2022",
      "time": "2:30",
      "Price": "230",
      "date": "2/3/230",
      "item": "2",
      "product_type": "xx4",
      "quantity": "4",
      'TrackingNumber': "356729100",
    }
  ];
}
