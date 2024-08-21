import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/search/components/search_card.dart';

class SearchScreenController extends GetxController {
  static SearchScreenController instance = Get.find();

  // Define a variable to keep track of the selected index
  int selectedIndex = 0;
  int selectedIndexTwo = 0;
  int selectedIndexThree = 0;
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

  // Update the selected index and notify listeners
  void selectIndex(int index) {
    selectedIndex = index;
    update();
  }

  void selectIndexTwo(int index) {
    selectedIndexTwo = index;
    update();
  }

  void selectIndexThree(int index) {
    selectedIndexThree = index;
    update();
  }
}
