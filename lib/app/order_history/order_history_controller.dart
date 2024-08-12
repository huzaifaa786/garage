import 'package:get/get.dart';

class OrderHistoryController extends GetxController {
  static OrderHistoryController instance = Get.find();
  List<Map<String, dynamic>> orders = [
    {
      "productImage": "https://dummyimage.com/93x93/000/fff",
      "clientImage": "https://dummyimage.com/20x20/000/fff",
      "client Name": "Street garage",
      "product": "Car super power battery",
      "product_Detail": "",
      "carName": "white Mercedes 2022",
      "date": "",
      "time": "",
      "Price": "230",
      "item": "2",
      "product_type": "",
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
    },
    {
      "productImage": "https://dummyimage.com/93x93/000/fff",
      "clientImage": "https://dummyimage.com/20x20/000/fff",
      "client Name": "Street garage",
      "product": "Car battery oil",
      "product_Detail": "",
      "carName": "white Mercedes 2022",
      "date": "",
      "time": "",
      "Price": "230",
      "item": "2",
      "product_type": "",
    }
  ];
}
