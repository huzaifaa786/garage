import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceItem {
  final String imageUrl;
  final String text;
  final String subText;

  ServiceItem(
      {required this.imageUrl, required this.text, required this.subText});
}

class ServiceCards {
  final String image;
  final String title;
  final String price;
  final VoidCallback onTap;

  ServiceCards({
    required this.image,
    required this.title,
    required this.price,
    required this.onTap,
  });
}

class HomeController extends GetxController {
  static HomeController instance = Get.find();

  bool _showAllItems = false;

  bool get showAllItems => _showAllItems;

  void toggleView() {
    _showAllItems = !_showAllItems;
    update();
  }

  bool get hasServices => services.isNotEmpty;
  int get itemCount => showAllItems ? services.length : 4;

  var services = <ServiceItem>[
    ServiceItem(
        imageUrl: 'https://dummyimage.com/70x70/000/fff',
        text: 'Car wash',
        subText: ''),
    ServiceItem(
        imageUrl: 'https://dummyimage.com/70x70/000/fff',
        text: 'Oil change',
        subText: ''),
    ServiceItem(
        imageUrl: 'https://dummyimage.com/70x70/000/fff',
        text: 'Tyre Retations',
        subText: ''),
    ServiceItem(
        imageUrl: 'https://dummyimage.com/70x70/000/fff',
        text: 'Road Assistance',
        subText: ''),
    ServiceItem(
        imageUrl: 'https://dummyimage.com/70x70/000/fff',
        text: 'Engine Diagnostic',
        subText: ''),
    ServiceItem(
        imageUrl: 'https://dummyimage.com/70x70/000/fff',
        text: 'Battery',
        subText: ''),
    ServiceItem(
        imageUrl: 'https://dummyimage.com/70x70/000/fff',
        text: 'Recovery',
        subText: ''),
    ServiceItem(
        imageUrl: 'https://dummyimage.com/70x70/000/fff',
        text: 'Air Conditioning',
        subText: ''),
    ServiceItem(
        imageUrl: 'https://dummyimage.com/70x70/000/fff',
        text: 'Fuel Delivery',
        subText: ''),
  ];

  String? img = 'assets/images/home_crousal.png';
  // var servicesCards = <ServiceCards>[
  //   // ServiceCards(
  //   //     image: 'https://dummyimage.com/70x70/000/fff',
  //   //     title: 'Hand washing car',
  //   //     price: '90.90909090',
  //   //     onTap: () {}),
  //   // ServiceCards(
  //   //     image: 'https://dummyimage.com/70x70/000/fff',
  //   //     title: 'Automatic washing car',
  //   //     price: '1234567821',
  //   //     onTap: () {}),
  //   // ServiceCards(
  //   //     image: 'https://dummyimage.com/70x70/000/fff',
  //   //     title: 'Self washing car',
  //   //     price: 'qwerty',
  //   //     onTap: () {}),
  //   // ServiceCards(
  //   //     image: 'https://dummyimage.com/70x70/000/fff',
  //   //     title: 'Hand washing car',
  //   //     price: 'ytrewq',
  //   //     onTap: () {}),
  //   // ServiceCards(
  //   //     image: 'https://dummyimage.com/70x70/000/fff',
  //   //     title: 'Automatic washing car',
  //   //     price: '',
  //   //     onTap: () {}),
  //   // ServiceCards(
  //   //     image: 'https://dummyimage.com/70x70/000/fff',
  //   //     title: 'Self washing car',
  //   //     price: '',
  //   //     onTap: () {}),
  // ];
}
