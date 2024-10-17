import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentsController extends GetxController {
  static PaymentsController instance = Get.find();
   TextEditingController promocodeController = TextEditingController();
  bool isapplied = false;

  Future<void> promoCode() async {
    isapplied = true;
    update();
    return;
  }
  
   String? date = '';
  String? location = '';
   @override
  void onInit() {
    super.onInit();
    isapplied = false;
     date = Get.parameters['date'].toString();
    location = Get.parameters['location'].toString();
   
  }

  List<Map<String, dynamic>> orders = [
    {
      "productImage": "assetPath: 'assets/images/washing.png',",
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
       {
      "productImage": "assetPath: 'assets/images/battery.png',",
      "clientImage": "https://dummyimage.com/20x20/000/fff",
      "client Name": "Street garage",
      "product": "Car super power battery",
      "product_Detail": "",
      "carName": "white Mercedes 2022",
      "date": "2/3/230",
      "time": "2:30",
      "Price": "230",
      "product_type": "self-service car wash",
    },   {
      "productImage": "assetPath: 'assets/images/washing.png',",
      "clientImage": "https://dummyimage.com/20x20/000/fff",
      "client Name": "Street garage",
      "product": "Car super power battery",
      "product_Detail": "",
      "carName": "white Mercedes 2022",
      "date": "2/3/230",
      "time": "2:30",
      "Price": "230",
      "product_type": "self-service car wash",
    },   {
      "productImage": "assetPath: 'assets/images/battery.png',",
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
