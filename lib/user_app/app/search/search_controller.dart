import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/search/components/search_card.dart';

class SearchScreenController extends GetxController {
  static SearchScreenController instance = Get.find();

  // Define variables to keep track of selected indices for each group
  int selectedIndexPrice = 0;
  int selectedIndexClosest = 0;
  int selectedIndexRating = 0;
  int selectedIndexResults = 0;

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

  // Update the selected index for Price group and notify listeners
  void selectIndexPrice(int index) {
    selectedIndexPrice = index;
    update();
  }

  // Update the selected index for The Closest group and notify listeners
  void selectIndexClosest(int index) {
    selectedIndexClosest = index;
    update();
  }

  // Update the selected index for Rating group and notify listeners
  void selectIndexRating(int index) {
    selectedIndexRating = index;
    update();
  }

  // Update the selected index for Results group and notify listeners
  void selectIndexResults(int index) {
    selectedIndexResults = index;
    update();
  }
}
