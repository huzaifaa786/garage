// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/app/home/components/service_cards.dart';

class ServiceItem {
  final String imageUrl;
  final String text;

  ServiceItem({
    required this.imageUrl,
    required this.text,
  });
}

class ServiceCardItems {
  final String imageUrl;
  final String text;
  final String price;
  final VoidCallback onTap;

  ServiceCardItems({
    required this.imageUrl,
    required this.text,
    required this.price,
    required this.onTap,
  });
}

class HomeController extends GetxController {
  static HomeController instance = Get.find();

  var services = <ServiceItem>[
    ServiceItem(
      imageUrl: 'https://dummyimage.com/70x70/000/fff',
      text: 'Car wash',
    ),
    ServiceItem(
      imageUrl: 'https://dummyimage.com/70x70/000/fff',
      text: 'Oil change',
    ),
    ServiceItem(
      imageUrl: 'https://dummyimage.com/70x70/000/fff',
      text: 'Battery',
    ),
    ServiceItem(
      imageUrl: 'https://dummyimage.com/70x70/000/fff',
      text: 'Road Service',
    ),
    ServiceItem(
      imageUrl: 'https://dummyimage.com/70x70/000/fff',
      text: 'Maintenance',
    ),
    ServiceItem(
      imageUrl: 'https://dummyimage.com/70x70/000/fff',
      text: 'Battery',
    ),
    ServiceItem(
      imageUrl: 'https://dummyimage.com/70x70/000/fff',
      text: 'Car wash',
    ),
    ServiceItem(
      imageUrl: 'https://dummyimage.com/70x70/000/fff',
      text: 'Oil change',
    ),
  ];

  var servicesCards = <ServiceCard>[
    ServiceCard(
      image: 'https://dummyimage.com/70x70/000/fff',
      title: 'Hand washing car',
      price: '90.90909090',
      onTap: () {},
    ),
    ServiceCard(
      image: 'https://dummyimage.com/70x70/000/fff',
      title: 'Automatic washing car',
      price: '1234567821',
      onTap: () {},
    ),
    ServiceCard(
      image: 'https://dummyimage.com/70x70/000/fff',
      title: 'Self washing car',
      price: 'qwerty',
      onTap: () {},
    ),
    ServiceCard(
      image: 'https://dummyimage.com/70x70/000/fff',
      title: 'Hand washing car',
      price: 'ytrewq',
      onTap: () {},
    ),
    ServiceCard(
      image: 'https://dummyimage.com/70x70/000/fff',
      title: 'Automatic washing car',
      price: '',
      onTap: () {},
    ),
    ServiceCard(
      image: 'https://dummyimage.com/70x70/000/fff',
      title: 'Self washing car',
      price: '',
      onTap: () {},
    ),
  ];

  @override
  void onInit() {
    super.onInit();
  }
}
