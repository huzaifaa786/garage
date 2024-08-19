import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController instanse = Get.find();
  TextEditingController promocodeController = TextEditingController();
  bool isapplied = false;

  Future<void> promoCode() async {
    isapplied = true;
    update();
    return;
  }

  @override
  void onInit() {
    super.onInit();
    isapplied = false;
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
      "product_type": "self-service car wash",
    },
  ];
}
