import 'package:get/get.dart';

class OrderHistoryController extends GetxController {
  static OrderHistoryController instance = Get.find();
  List<Map<String, dynamic>> orders = [
    {
      "productImage": "https://dummyimage.com/93x93/000/fff",
      "clientImage": "https://dummyimage.com/20x20/000/fff",
      "client Name": "Street garage",
      "product": "Car super power battery ",
      "product_Detail": "Small , big",
      "carName": "white Mercedes 2022",
      "date": "222",
      "time": "333",
      "Price": "230",
      "item": "2",
    },
    {
      "productImage": "https://dummyimage.com/93x93/000/fff",
      "clientImage": "https://dummyimage.com/20x20/000/fff",
      "client Name": "Street garage",
      "product": "Car washing",
      "product_Detail": "self-service car wash",
      "carName": "white Mercedes 2022",
      "date": "2/3/230",
      "time": "2:30",
      "Price": "230",
      "item": "3",
    },
    {
      "productImage": "https://dummyimage.com/93x93/000/fff",
      "clientImage": "https://dummyimage.com/20x20/000/fff",
      "client Name": "Street garage",
      "product": "Car battery oil",
      "product_Detail": "Small , big",
      "carName": "white Mercedes 2022",
      "date": "33",
      "time": "33",
      "Price": "230",
      "item": "2",
    }
  ];
}
