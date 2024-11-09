import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/apis/user_apis/post_api/post_api.dart';
import 'package:mobilegarage/models/garage_model.dart';

class SearchScreenController extends GetxController {
  static SearchScreenController instance = Get.find();
  TextEditingController searchController = TextEditingController();
  int selectedIndexPrice = 0;
  int selectedIndexClosest = 0;
  int selectedIndexRating = 0;
  int selectedIndexResults = 0;
  String selecetedPrice = '';
  String selecetedPlace = '';
  String selecetedRating = '';

  void updateApplySelections() {
    selecetedPrice = selectedIndexPrice == 0
        ? ''
        : selectedIndexPrice == 1
            ? 'From low to high'
            : 'From high to low';
    /////////
    selecetedPlace = selectedIndexClosest == 0
        ? ''
        : selectedIndexClosest == 1
            ? 'From the closest to the furthest'
            : 'Random';
    ////////////
    selecetedRating = selectedIndexRating == 0
        ? ''
        : selectedIndexRating == 1
            ? 'From high to low'
            : 'From low to high';

    update();
    // filter  with rating
    if (selectedIndexRating == 2) {
      filteredGarages.sort((a, b) => (double.tryParse(a.rating ?? '0') ?? 0)
          .compareTo(double.tryParse(b.rating ?? '0') ?? 0));
    } else if (selectedIndexRating == 1) {
      filteredGarages.sort((a, b) => (double.tryParse(b.rating ?? '0') ?? 0)
          .compareTo(double.tryParse(a.rating ?? '0') ?? 0));
    }

  //     if (selectedIndexClosest == 1) {
  //   filteredGarages.sort((a, b) {
  //     double? distanceA = _calculateDistance(a.lat, a.lng);
  //     double? distanceB = _calculateDistance(b.lat, b.lng);
  //     return distanceA.compareTo(distanceB);
  //   });
  // } else if (selectedIndexClosest == 2) {
  // }
    update();
  }
// double _calculateDistance(double? lat2, double? lng2) {
//   if (lat == null || lng == null || lat2 == null || lng2 == null) {
//     return double.infinity; // Return a large value if coordinates are missing
//   }
  
//   const double radius = 6371; // Radius of the Earth in kilometers
//   double dLat = _degreesToRadians(lat2 - lat!);
//   double dLng = _degreesToRadians(lng2 - lng!);
//   double a = (sin(dLat / 2) * sin(dLat / 2)) +
//       cos(_degreesToRadians(lat!)) *
//           cos(_degreesToRadians(lat2)) *
//           (sin(dLng / 2) * sin(dLng / 2));
//   double c = 2 * atan2(sqrt(a), sqrt(1 - a));
//   return radius * c; // Distance in kilometers
// }

// double _degreesToRadians(double degrees) {
//   return degrees * (pi / 180);
// }
  void ResetSelections() {
    selecetedPrice = '';
    selecetedPlace = '';
    selecetedRating = '';
    selectIndexPrice(0);
    selectIndexClosest(0);
    selectIndexRating(0);
    update();
  }

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
