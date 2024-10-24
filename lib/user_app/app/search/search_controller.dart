import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/apis/user_apis/post_api/post_api.dart';
import 'package:mobilegarage/models/garage_model.dart';
import 'package:mobilegarage/user_app/app/search/components/search_card.dart';

class SearchScreenController extends GetxController {
  static SearchScreenController instance = Get.find();
  TextEditingController searchController = TextEditingController();
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

  void selectIndexPrice(int index) {
    selectedIndexPrice = index;
    update();
  }

  void selectIndexClosest(int index) {
    selectedIndexClosest = index;
    update();
  }

  void selectIndexRating(int index) {
    selectedIndexRating = index;
    update();
  }

  void selectIndexResults(int index) {
    selectedIndexResults = index;
    update();
  }

  // TODO implementation code //

  List<GarageModel> garages = [];
  List<GarageModel> filteredGarages = [];
  String? searchText = '';
  String selectedCategory = '';

  @override
  void onInit() {
    searchText = Get.parameters['searchtext']?.toString();
    searchController.text = searchText.toString();
    getGarages();
    super.onInit();
  }

  Future getGarages() async {
    var response = await PostApi.getAllGarages(searchText);
    log('$response');
    if (response != {}) {
      garages = (response['garages'] as List<dynamic>)
          .map((postJson) => GarageModel.fromJson(postJson))
          .toList();
      filteredGarages = garages;
      if (garages.isNotEmpty) {
        GarageModel post = garages.first;
        lat = double.tryParse(post.lat!);
        lng = double.tryParse(post.lng!);
        getPlaceName(lat!, lng!);
      }
    }
    update();
  }

  void filterPosts({String? query, String? category}) {
    searchText = query ?? '';
    selectedCategory = category ?? '';

    print(
        'Filtering garages with searchText: $searchText and selectedCategory: $selectedCategory');

    if (searchText!.isEmpty && selectedCategory.isEmpty) {
      filteredGarages = garages;
    } else {
      filteredGarages = garages.where((post) {
        final postName = post.name?.toLowerCase() ?? '';
        // final postCategory = post.subCategory?.name.toLowerCase() ?? '';

        final matchesSearchText =
            searchText!.isEmpty || postName.contains(searchText!.toLowerCase());
        // final matchesCategory = selectedCategory.isEmpty || postCategory.contains(selectedCategory.toLowerCase());

        return matchesSearchText;
        // || matchesCategory;
      }).toList();
    }
    print('Filtered garages count: ${filteredGarages.length}');
    update();
  }

// Location
  String currentAddress = '';
  double? lat;
  double? lng;

  Future<void> getPlaceName(double latitude, double longitude) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    if (placemarks.isNotEmpty) {
      Placemark place = placemarks.first;
      currentAddress =
          //  '${place.name},'
          ' ${place.locality}, ${place.administrativeArea}, ${place.country}';
    }
    update();
  }
}
