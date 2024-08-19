import 'package:get/get.dart';
import 'package:mobilegarage/app/search/components/search_card.dart';

class SearchScreenController extends GetxController {
  static SearchScreenController instanse = Get.find();
  var searchCards = <SearchCard>[
    SearchCard(
        image: 'https://dummyimage.com/70x70/000/fff',
        title: 'Hand washing car',
        price: '90.90909090',
        onTap: () {}),
    SearchCard(
        image: 'https://dummyimage.com/70x70/000/fff',
        title: 'Automatic washing car',
        price: '1234567821',
        onTap: () {}),
  ];
 
}
